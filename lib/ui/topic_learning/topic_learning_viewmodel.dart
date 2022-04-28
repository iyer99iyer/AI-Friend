import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class TopicLearningViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _textHint = 'Hello how are you doing';
  String _textListening = '';
  double _confidence = 1.0;

  bool get isListening => _isListening;
  String get textHint => _textHint;
  String get textListening => _textListening;
  double get confidence => _confidence;

  Future init() async {
    _speech = stt.SpeechToText();
  }

  onTapSendButton() {
    _textListening = _textListening.trim();
    print('_textListening : ${_textListening.toUpperCase()} == _textHint : ${_textHint.toUpperCase()}');
    if(_textListening.toUpperCase() == _textHint.toUpperCase()) {
      print('true');
      _textListening = '';
    }else
      {
        print('_textListening : ${_textListening.toUpperCase()} == _textHint : ${_textHint.toUpperCase()}');
      }
    notifyListeners();
  }

  listen() async {
    if (!_isListening) {
      _textListening = '';
      notifyListeners();
      bool available = await _speech.initialize(
          onStatus: (val) {
            print('onStatus: $val');
            if (val == 'done') {
              _isListening = false;
              notifyListeners();
            }
          },
          onError: (val) => print('onError: $val'));
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
  }


}
