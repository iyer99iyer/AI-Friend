import 'package:ai_friend/data/database_tables/conversation_table.dart';
import 'package:ai_friend/data/drift_database.dart';
import 'package:drift/drift.dart';

part 'conversation_dao.g.dart';

@DriftAccessor(tables: [Conversations])
class ConversationsDao extends DatabaseAccessor<MyDatabase>
    with _$ConversationsDaoMixin {
  ConversationsDao(MyDatabase db) : super(db);

  Future<List<Conversation>> getAllConversation(String option) =>
      (select(conversations)
        ..where((conversation) =>
        conversation.option.equals(option) &
        conversations.done.equals(true))
        ..orderBy(
            [(conversation) => OrderingTerm(expression: conversation.conversationDateTime)]))
          .get();

  Stream<List<Conversation>> getDoneAllConversationStream(String option) =>
      (select(conversations)
            ..where((conversation) =>
                conversation.option.equals(option) &
                conversations.done.equals(true))
            ..orderBy(
                [(conversation) => OrderingTerm(expression: conversation.conversationDateTime)]))
          .watch();

  // Stream<List<Conversation>> getAllConversationNotDoneStream(String option) =>
  //     (select(conversations)
  //           ..where((conversation) =>
  //               conversation.option.equals(option) &
  //               conversations.done.equals(false))
  //           ..orderBy(
  //               [(conversation) => OrderingTerm(expression: conversation.id)]))
  //         .watch();

  Future insertConversation(ConversationsCompanion conversationsCompanion) =>
      into(conversations).insert(conversationsCompanion);

  Future deleteConversation(ConversationsCompanion conversationsCompanion) =>
      delete(conversations).delete(conversationsCompanion);

  Future updateConversation(ConversationsCompanion conversationsCompanion) =>
      update(conversations).replace(conversationsCompanion);

  deleteAllConversationFor(String option) =>
      (delete(conversations)..where((conversation) => conversation.option.equals(option))).go();
}
