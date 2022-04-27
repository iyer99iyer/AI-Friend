import 'package:ai_friend/ui/options/options_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../data/drift_database.dart';
import '../ui/dashboard/dashboard_view.dart';
import '../ui/startup/startup_view.dart';
import 'package:ai_friend/ui/topic_learning/topic_learning_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: OptionsView),
    MaterialRoute(page: TopicLearningView)

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: MyDatabase)
  ]
)
class AppSetup{
  /**Serves no purpose besides having an annotation attached to it */
}