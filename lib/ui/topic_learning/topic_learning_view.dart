import 'package:ai_friend/ui/topic_learning/topic_learning_viewmodel.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              body: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  // Voice recognition Container
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFC1C1C1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: SingleChildScrollView(
                              reverse: true,
                              child:  Container(
                                padding: const EdgeInsets.fromLTRB(30, 30, 30, 150),
                                width: double.infinity,
                                child: !model.isListening ? Text(
                                  model.textListening == '' ?
                                    'Press the button and start speaking':
                                    model.textListening,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ):
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  model.textListening == '' ? Icon(Icons.account_tree):Container(),
                                  model.textListening == '' ? Text('Try Saying'):Container(),
                                  Text( model.textListening == '' ? model.textHint:model.textListening,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),)
                                ],
                              ),
                              )
                            ),
                          ),
                        ),
                        model.textListening == '' ? Container() :Positioned(
                            right: 20,
                            bottom: 45,
                            child: GestureDetector(
                              behavior:HitTestBehavior.translucent,
                              onTap: () => model.onTapSendButton(),
                              child: SizedBox(
                                // height: 10,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,child: Icon(Icons.send,),
                                  radius: 28,
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: AvatarGlow(
                animate: model.isListening,
                glowColor: Theme.of(context).primaryColor,
                endRadius: 75.0,
                duration: const Duration(milliseconds: 2000),
                repeatPauseDuration: const Duration(milliseconds: 100),
                repeat: true,
                child: FloatingActionButton(
                  onPressed: () => model.listen(),
                  child: Icon(Icons.mic),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
        viewModelBuilder: () => TopicLearningViewModel());
  }
}
