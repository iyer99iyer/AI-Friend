import 'package:ai_friend/data/drift_database.dart';
import 'package:drift/drift.dart';

import '../../database_tables/member_table.dart';

part 'member_dao.g.dart';

@DriftAccessor(tables: [Members])
class MembersDao extends DatabaseAccessor<MyDatabase> with _$MembersDaoMixin {
  MembersDao(MyDatabase db) : super(db);

  Future getAllMembers() => select(members).get();

  Future searchMember(MembersCompanion membersCompanion) => (select(members)
        ..where(
          (member) => member.emailAddress.equals(
            membersCompanion.emailAddress.toString(),
          ),
        ))
      .get();
  Future insertMember(MembersCompanion membersCompanion) =>
      into(members).insert(membersCompanion);

  getMemberByEmail(String email) {
    return (select(members)
          ..where(
            (member) {
              print(member.emailAddress.equals(email));
              return member.emailAddress.equals(email);
            } ,
          ))
        .get();
  }
}
