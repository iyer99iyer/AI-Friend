import 'package:drift/drift.dart';

class Members extends Table {

  TextColumn get name => text().withLength(max: 8)();
  TextColumn get emailAddress => text()();
  TextColumn get password => text().nullable()();
  TextColumn get profilePic => text().nullable()();

  @override
  Set<Column> get primaryKey => {emailAddress};
}