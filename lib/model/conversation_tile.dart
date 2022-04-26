import 'package:flutter/material.dart';

class ConversationTile{
  final String categoryName;
  final String lastConversation;
  final Icon categoryIcon;
  final DateTime lastConversationDateTime;

  ConversationTile(
      {required this.lastConversation,
      required this.categoryIcon,
      required this.categoryName,
      required this.lastConversationDateTime});

}