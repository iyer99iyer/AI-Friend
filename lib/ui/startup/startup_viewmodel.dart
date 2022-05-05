import 'package:ai_friend/data/DAOs/conversation_dao/conversation_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../data/DAOs/const_conversation_dao/const_conversation_dao.dart';
import '../../data/drift_database.dart';
import '../shared/constants.dart';

class StartupViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();
  final _database = locator<MyDatabase>();

  late List<ConstConversationsCompanion> _constConversationsList = [];

  Future init() async{
    List<ConstConversation> constConversationList = await ConstConversationsDao(_database).getAllConversation('restaurant');

    if (constConversationList.isEmpty) {
      _constConversationsList = constConversations;
      for (ConstConversationsCompanion constConversationsCompanion in _constConversationsList) {
        await ConstConversationsDao(_database).insertConversation(
            constConversationsCompanion);
      }
    }else{
      print(constConversationList.first);
    }

    // Check whether user already logged in
    if(await checkUserLoggedIn()){
      _navigationService.navigateTo(Routes.dashboardView);
    }else{
      _navigationService.navigateTo(Routes.loginView);
    }

    // For(Conversation conversation in conversationListStream.)

  }

  void doSomething(){
    _navigationService.navigateTo(Routes.signupView);
  }

  Future<bool> checkUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool(LOGGEDIN);
    print("user logged in: $loggedIn");
    if(loggedIn != null){
      return loggedIn;
    }else{
      return false;
    }
  }
}