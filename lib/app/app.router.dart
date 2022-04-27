// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/dashboard/dashboard_view.dart';
import '../ui/options/options_view.dart';
import '../ui/startup/startup_view.dart';
import '../ui/topic_learning/topic_learning_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String dashboardView = '/dashboard-view';
  static const String optionsView = '/options-view';
  static const String topicLearningView = '/topic-learning-view';
  static const all = <String>{
    startUpView,
    dashboardView,
    optionsView,
    topicLearningView,
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => const TopicLearningView(topicName: 'test',),
        settings: data,
      );
    },
  };
}
