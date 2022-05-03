

import 'package:drift/drift.dart';

import '../../data/drift_database.dart';

final List<ConstConversationsCompanion> constConversations = [
  ConstConversationsCompanion(sentence: Value('Hello'), type: Value('bot'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'),done: Value(false)),
  ConstConversationsCompanion(sentence: Value('Good afternoon'), type: Value('human'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('Welcome to the restaurant'), type: Value('bot'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('Thank you'), type: Value('human'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('What would you like?'), type: Value('bot'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('I would like a tea'), type: Value('human'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('Would you like some food?'), type: Value('bot'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('A fish please'), type: Value('human'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('Anything else?'), type: Value('bot'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('Yes, with grilled vegetables'), type: Value('human'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('Would you like some water?'), type: Value('bot'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
  ConstConversationsCompanion(sentence: Value('Yes, please'), type: Value('human'), conversationDateTime: Value(DateTime.now()), option: Value('restaurant'), done: Value(false)),
];