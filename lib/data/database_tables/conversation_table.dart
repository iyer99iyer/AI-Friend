import 'package:drift/drift.dart';

class Conversations extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get sentence => text()();
  TextColumn get type => text()();
  TextColumn get option => text()();
  BoolColumn get done => boolean().nullable()();
  DateTimeColumn get conversationDateTime => dateTime()();

}