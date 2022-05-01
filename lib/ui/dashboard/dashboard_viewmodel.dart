import 'package:ai_friend/app/app.router.dart';
import 'package:ai_friend/model/conversation_tile.dart';
import 'package:ai_friend/ui/topic_learning/topic_learning_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../services/google_sign_in_service.dart';

class DashboardViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();
  final _googleSignInService = locator<GoogleSignInService>();

  Future init() async{

  }

  List<ConversationTile> _conversationTiles = [
    ConversationTile(lastConversation: 'Welcome to the restaurant', categoryName: 'restaurant', categoryIcon: Icon(Icons.restaurant), lastConversationDateTime: DateTime.now())
  ];

  List<ConversationTile> get getConversationTiles => _conversationTiles;

  void doSomething(){
    // _navigationService.navigateTo(Routes.mainPageView);
  }

  navigateToNewConversationPage() {
    _navigationService.navigateTo(Routes.optionsView);
  }

  navigateToConversationPage(String categoryName) {
    _navigationService.navigateToView(TopicLearningView(topicName: categoryName));
  }

  Future<void> signOut() async {
    await _googleSignInService.googleSignOut();
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }
}