import 'package:ai_friend/ui/topic_learning/topic_learning_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TopicLearningView extends StatelessWidget {

  final String topicName;

  const TopicLearningView({Key? key, required this.topicName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopicLearningViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text(topicName),
            ),
            body:Container(
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.mic),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              ),
        viewModelBuilder: () => TopicLearningViewModel());
  }
}