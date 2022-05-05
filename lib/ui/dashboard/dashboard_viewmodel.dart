import 'package:ai_friend/app/app.router.dart';
import 'package:ai_friend/data/DAOs/const_conversation_dao/const_conversation_dao.dart';
import 'package:ai_friend/model/conversation_tile.dart';
import 'package:ai_friend/ui/topic_learning/topic_learning_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../data/DAOs/conversation_dao/conversation_dao.dart';
import '../../data/drift_database.dart';
import '../../services/google_sign_in_service.dart';
import '../shared/constants.dart';


class DashboardViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();
  final _googleSignInService = locator<GoogleSignInService>();
  final _database = locator<MyDatabase>();

  bool conversationIsEmpty = true;

  Future init() async{
    // await getAllDoneConversation();
    // notifyListeners();
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
    try {
      await _googleSignInService.googleSignOut();
    }catch(e) {
      printError();
    }finally{
      await userLoggedOutRecord();
      _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
    }
  }

  // getAllDoneConversation() async {
  //   List<Conversation> _conversationsList= await ConversationsDao(_database).getAllConversation('restaurant');
  //   print('&&&&&&&&&'+_conversationsList.toString());
  //   if(_conversationsList.isEmpty)
  //     conversationIsEmpty = false;
  //   else
  //     conversationIsEmpty = true;
  // }

  getAllDoneConversationStream() {
    return ConversationsDao(_database).getDoneAllConversationStream('restaurant');
  }

  deleteAllConversationFor(String option) async {
    await ConversationsDao(_database).deleteAllConversationFor(option);
    await ConstConversationsDao(_database).updateConversationFor(option);
  }

  userLoggedOutRecord() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LOGGEDIN, false);
    final loggedIn = prefs.getBool(LOGGEDIN);
    print("user logged out: $loggedIn");
  }
}