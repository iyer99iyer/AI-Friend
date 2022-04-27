import 'package:ai_friend/ui/topic_learning/topic_learning_viewmodel.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TopicLearningView extends StatelessWidget {
  final String topicName;

  const TopicLearningView({Key? key, required this.topicName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopicLearningViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text(topicName),
              ),
              body: SingleChildScrollView(
                reverse: true,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 150),
                    child: Text(model.text)
                ),
              ),
              floatingActionButton: AvatarGlow(
                animate: model.isListening,
                glowColor: Theme.of(context).primaryColor,
                endRadius: 75.0,
                duration: const Duration(milliseconds: 2000),
                repeatPauseDuration: const Duration(milliseconds: 100),
                repeat: true,
                child: FloatingActionButton(
                  onPressed: ()=>model.listen(),
                  child: Icon(Icons.mic),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
        viewModelBuilder: () => TopicLearningViewModel());
  }
}
