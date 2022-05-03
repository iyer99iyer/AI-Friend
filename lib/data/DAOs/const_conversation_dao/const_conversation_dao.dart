import 'package:ai_friend/data/drift_database.dart';
import 'package:drift/drift.dart';

import '../../database_tables/const_conversation_table.dart';

part 'const_conversation_dao.g.dart';

@DriftAccessor(tables: [ConstConversations])
class ConstConversationsDao extends DatabaseAccessor<MyDatabase>
    with _$ConstConversationsDaoMixin {
  ConstConversationsDao(MyDatabase db) : super(db);

  Future<List<ConstConversation>> getAllConversation(String option) =>
      (select(constConversations)
        ..where((constConversation) =>
        constConversation.option.equals(option) &
        constConversation.done.equals(true))
        ..orderBy(
            [(conversation) => OrderingTerm(expression: conversation.conversationDateTime)]))
          .get();

  // Stream<List<Conversation>> getDoneAllConversationStream(String option) =>
  //     (select(conversations)
  //           ..where((conversation) =>
  //               conversation.option.equals(option) &
  //               conversations.done.equals(true))
  //           ..orderBy(
  //               [(conversation) => OrderingTerm(expression: conversation.conversationDateTime)]))
  //         .watch();
  //
  Stream<List<ConstConversation>> getAllConversationNotDoneStream(String option) =>
      (select(constConversations)
            ..where((constConversation) =>
            constConversation.option.equals(option) &
            constConversation.done.equals(false))
            ..orderBy(
                [(conversation) => OrderingTerm(expression: conversation.id)]))
          .watch();

  Future insertConversation(ConstConversationsCompanion constConversationsCompanion) =>
      into(constConversations).insert(constConversationsCompanion);

  Future deleteConversation(ConstConversationsCompanion constConversationsCompanion) =>
      delete(constConversations).delete(constConversationsCompanion);

  Future updateConversation(ConstConversationsCompanion constConversationsCompanion) =>
      update(constConversations).replace(constConversationsCompanion);

  updateConversationFor(String option) {
    (update(constConversations)..where((constConversation) => constConversation.option.equals(option))).write(ConstConversationsCompanion(done: Value(false)));
  }
}
