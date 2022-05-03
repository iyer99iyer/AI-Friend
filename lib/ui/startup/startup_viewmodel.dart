import 'package:ai_friend/data/DAOs/conversation_dao/conversation_dao.dart';
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



    // For(Conversation conversation in conversationListStream.)

  }

  void doSomething(){
    _navigationService.navigateTo(Routes.signupView);
  }
}