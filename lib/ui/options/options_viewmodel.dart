import 'package:ai_friend/model/options_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ai_friend/ui/topic_learning/topic_learning_view.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class OptionsViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  List<Option> _options = [
    Option(categoryName: 'Restaurant', categoryIcon: Icons.restaurant),
    Option(categoryName: 'Hospital', categoryIcon: Icons.local_hospital),
    Option(categoryName: 'Shop', categoryIcon: Icons.store_mall_directory),
  ];

  List<Option> get options => _options;

  Future init() async{

  }

  navigateToTopicLearnScreen(String categoryName) {
    _navigationService.navigateToView(TopicLearningView(topicName: categoryName,));
  }

}