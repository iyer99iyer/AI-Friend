import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class TopicLearningViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  bool get isListening => _isListening;
  String get text => _text;
  double get confidence => _confidence;

  Future init() async {
    _speech = stt.SpeechToText();
  }

  listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
          onStatus: (val) {
            print('onStatus: $val');
            if (val == 'done') _isListening = false;
            notifyListeners();
          },
          onError: (val) => print('onError: $val'));
      if (available) {
        _isListening = true;
        notifyListeners();
        _speech.listen(onResult: (val) {
          _text = val.recognizedWords;
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
