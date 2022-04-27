import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class TopicLearningViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();



  Future init() async{

  }

  void doSomething(){
    _navigationService.navigateTo(Routes.dashboardView);
  }
}