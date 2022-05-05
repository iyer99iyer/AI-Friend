import 'package:drift/drift.dart' as drift;
import 'package:ai_friend/data/DAOs/conversation_dao/conversation_dao.dart';
import 'package:ai_friend/ui/shared/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../data/DAOs/const_conversation_dao/const_conversation_dao.dart';
import '../../data/database_tables/const_conversation_table.dart';
import '../../data/drift_database.dart';

class TopicLearningViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _database = locator<MyDatabase>();

  late stt.SpeechToText _speech;
  List<ConversationsCompanion> _conversations = [];
  // List<Conversation> _doneConversations = [];
  late String _topicName;
  bool _isListening = false;
  late String _textHint;
  late ConstConversationsCompanion _humanConversation;
  late ConstConversationsCompanion _botConversation;
  late int _addBotConversationID;
  String _textListening = '';
  double _confidence = 1.0;

  bool get isListening => _isListening;
  String get textHint => _textHint;
  String get textListening => _textListening;
  double get confidence => _confidence;
  stt.SpeechToText get speech => _speech;
  // List<Conversation> get conversations => _conversations;
  // List<Conversation> get doneConversations => _doneConversations;

  Future init({required String topicName}) async {
    _speech = stt.SpeechToText();
    _topicName = topicName;
    // _conversations = constConversations;
    await moveNextConversationSentence();
    notifyListeners();
  }

  moveNextConversationSentence() async {
    // TODO: get first const conversation to bot variable (done = false)
    _botConversation = convertConstConversationsToConstConversationsCompanion(
        await getAllNotDoneConstConversationStream()
            .first
            .then((value) => value.first));
    // TODO: update first const conversation (bot) done => true
    await updateConstConversation(_botConversation.copyWith(
      done: drift.Value(true),
      conversationDateTime: drift.Value(DateTime.now()),
    ));
    // TODO: insert to conversation from first const conversation (bot) done => true
    _addBotConversationID = await insertConversation(
      convertConstConversationsCompanionToConversationCompanion(
        _botConversation.copyWith(
          id: drift.Value.absent(),
          done: drift.Value(true),
          conversationDateTime: drift.Value(DateTime.now()),
        ),
      ),
    );
    notifyListeners();
    // TODO: get first const conversation to human variable (done = false)
    _humanConversation = convertConstConversationsToConstConversationsCompanion(
        await getAllNotDoneConstConversationStream()
            .first
            .then((value) => value.first));
    _textHint = _humanConversation.sentence.value;
    notifyListeners();
  }

  onTapSendButton() async {
    // trimming the _textListening
    _textListening = _textListening.trim();

    // TODO: insert the text human has spoken to conversation table
    insertConversation(convertValueToConversationCompanion(
        _textListening, 'human', _topicName, true));

    notifyListeners();

    //test
    // print(
    //     '_textListening : ${_textListening.toUpperCase()} == _textHint : ${_textHint.toUpperCase()}');

    if (_textListening.toUpperCase() ==
        _textHint.replaceAll(',', '').toUpperCase()) {
      print('true');

      // TODO: insert the text bot has spoken to conversation table if correct
      await insertConversation(convertValueToConversationCompanion(
          'You have correctly said', 'bot', _topicName, true));

      // TODO: update the human statement in const Conversation (done => true)
      await updateConstConversation(_humanConversation.copyWith(
        done: drift.Value(true),
        conversationDateTime: drift.Value(DateTime.now()),
      ));

      notifyListeners();
      await moveNextConversationSentence();
      notifyListeners();
    } else {
      // TODO: insert bot to conversation to try again
      await insertConversation(convertValueToConversationCompanion(
          'Please try again', 'bot', _topicName, true));
      // TODO: insert bot to conversation from const conversation (previous)
      await insertConversation(
        convertConstConversationsCompanionToConversationCompanion(
          _botConversation.copyWith(
            id: drift.Value.absent(),
            done: drift.Value(true),
            conversationDateTime: drift.Value(DateTime.now()),
          ),
        ),
      );

      notifyListeners();

      // print('_textListening : ${_textListening.toUpperCase()} == _textHint : ${_textHint.toUpperCase()}');
    }
    _textListening = '';
    notifyListeners();

  }

  listen() async {
    if (!_isListening) {
      _textListening = '';
      notifyListeners();
      bool available = await _speech.initialize(
          onStatus: (status) {
            if (status == 'done' || status == 'notListening') {
              _isListening = false;
              print(_isListening);
              notifyListeners();
            }
            print('onStatus: $status');
          },
          onError: (val) { print('onError: $val');
          _isListening = false;
          notifyListeners();
          }
      );
      if (available) {
        _isListening = true;
        notifyListeners();
        _speech.listen(onResult: (val) {
          _textListening = val.recognizedWords;
          if (val.hasConfidenceRating && val.confidence > 0) {
            _confidence = val.confidence;
          }
          notifyListeners();
        });
      }
    } else {
      _isListening = false;
      notifyListeners();
      _speech.stop();
    }
    notifyListeners();
  }

  Stream<List<Conversation>>getAllDoneConversationStream() {
    return ConversationsDao(_database).getDoneAllConversationStream(_topicName);
  }

  insertConversation(ConversationsCompanion conversationsCompanion) async {
    return await ConversationsDao(_database)
        .insertConversation(conversationsCompanion);
  }

  deleteConversation(ConversationsCompanion conversationsCompanion) async {
    await ConversationsDao(_database)
        .deleteConversation(conversationsCompanion);
  }

  Stream<List<ConstConversation>> getAllNotDoneConstConversationStream() {
    return ConstConversationsDao(_database)
        .getAllConversationNotDoneStream(_topicName);
  }

  updateConstConversation(
      ConstConversationsCompanion constConversationsCompanion) async {
    await ConstConversationsDao(_database)
        .updateConversation(constConversationsCompanion);
  }

  ConversationsCompanion convertConversationToConversationsCompanion(
      Conversation conversation) {
    return ConversationsCompanion(
      id: drift.Value(conversation.id),
      sentence: drift.Value(conversation.sentence),
      option: drift.Value(conversation.option),
      conversationDateTime: drift.Value(conversation.conversationDateTime),
      type: drift.Value(conversation.type),
      done: drift.Value(conversation.done),
    );
  }

  ConstConversationsCompanion
      convertConstConversationsToConstConversationsCompanion(
          ConstConversation constConversation) {
    return ConstConversationsCompanion(
      id: drift.Value(constConversation.id),
      sentence: drift.Value(constConversation.sentence),
      option: drift.Value(constConversation.option),
      conversationDateTime: drift.Value(constConversation.conversationDateTime),
      type: drift.Value(constConversation.type),
      done: drift.Value(constConversation.done),
    );
  }

  ConversationsCompanion convertValueToConversationCompanion(
      String sentence, String type, String option, bool done) {
    return ConversationsCompanion(
      sentence: drift.Value(sentence),
      type: drift.Value(type),
      conversationDateTime: drift.Value(DateTime.now()),
      option: drift.Value(option),
      done: drift.Value(done),
    );
  }

  ConversationsCompanion
      convertConstConversationsCompanionToConversationCompanion(
          ConstConversationsCompanion constConversationsCompanion) {
    return ConversationsCompanion(
      id: constConversationsCompanion.id,
      sentence: constConversationsCompanion.sentence,
      option: constConversationsCompanion.option,
      conversationDateTime: constConversationsCompanion.conversationDateTime,
      done: constConversationsCompanion.done,
      type: constConversationsCompanion.type,
    );
  }

  onDisposed() async {

    _isListening = false;

    // TODO: update first const conversation (bot) done => false
    await updateConstConversation(_botConversation.copyWith(
      done: drift.Value(false),
      conversationDateTime: drift.Value(DateTime.now()),
    ));

    // TODO: delete the record from conversation table
    await deleteConversation(
        convertConstConversationsCompanionToConversationCompanion(
          _botConversation.copyWith(
            id: drift.Value(_addBotConversationID),
            done: drift.Value(true),
            conversationDateTime: drift.Value(DateTime.now()),
          ),
        ),
    );

  }


}
