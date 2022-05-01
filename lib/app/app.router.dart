// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/dashboard/dashboard_view.dart';
import '../ui/login/login_view.dart';
import '../ui/options/options_view.dart';
import '../ui/signup/signup_view.dart';
import '../ui/startup/startup_view.dart';
import '../ui/topic_learning/topic_learning_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String dashboardView = '/dashboard-view';
  static const String optionsView = '/options-view';
  static const String topicLearningView = '/topic-learning-view';
  static const String loginView = '/login-view';
  static const String signupView = '/signup-view';
  static const all = <String>{
    startUpView,
    dashboardView,
    optionsView,
    topicLearningView,
    loginView,
    signupView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.dashboardView, page: DashboardView),
    RouteDef(Routes.optionsView, page: OptionsView),
    RouteDef(Routes.topicLearningView, page: TopicLearningView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DashboardView(),
        settings: data,
      );
    },
    OptionsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OptionsView(),
        settings: data,
      );
    },
    TopicLearningView: (data) {
      var args = data.getArgs<TopicLearningViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => TopicLearningView(
          key: args.key,
          topicName: args.topicName,
        ),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    SignupView: (data) {
      var args = data.getArgs<SignupViewArguments>(
        orElse: () => SignupViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// TopicLearningView arguments holder class
class TopicLearningViewArguments {
  final Key? key;
  final String topicName;
  TopicLearningViewArguments({this.key, required this.topicName});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// SignupView arguments holder class
class SignupViewArguments {
  final Key? key;
  SignupViewArguments({this.key});
}
