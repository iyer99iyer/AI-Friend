// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Member extends DataClass implements Insertable<Member> {
  final String name;
  final String emailAddress;
  final String? password;
  final String? profilePic;
  Member(
      {required this.name,
      required this.emailAddress,
      this.password,
      this.profilePic});
  factory Member.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Member(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      emailAddress: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email_address'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
      profilePic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_pic']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['email_address'] = Variable<String>(emailAddress);
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String?>(password);
    }
    if (!nullToAbsent || profilePic != null) {
      map['profile_pic'] = Variable<String?>(profilePic);
    }
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
    return MembersCompanion(
      name: Value(name),
      emailAddress: Value(emailAddress),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      profilePic: profilePic == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePic),
    );
  }

  factory Member.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Member(
      name: serializer.fromJson<String>(json['name']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      password: serializer.fromJson<String?>(json['password']),
      profilePic: serializer.fromJson<String?>(json['profilePic']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'password': serializer.toJson<String?>(password),
      'profilePic': serializer.toJson<String?>(profilePic),
    };
  }

  Member copyWith(
          {String? name,
          String? emailAddress,
          String? password,
          String? profilePic}) =>
      Member(
        name: name ?? this.name,
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        profilePic: profilePic ?? this.profilePic,
      );
  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('name: $name, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('password: $password, ')
          ..write('profilePic: $profilePic')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, emailAddress, password, profilePic);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          other.name == this.name &&
          other.emailAddress == this.emailAddress &&
          other.password == this.password &&
          other.profilePic == this.profilePic);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<String> name;
  final Value<String> emailAddress;
  final Value<String?> password;
  final Value<String?> profilePic;
  const MembersCompanion({
    this.name = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.password = const Value.absent(),
    this.profilePic = const Value.absent(),
  });
  MembersCompanion.insert({
    required String name,
    required String emailAddress,
    this.password = const Value.absent(),
    this.profilePic = const Value.absent(),
  })  : name = Value(name),
        emailAddress = Value(emailAddress);
  static Insertable<Member> custom({
    Expression<String>? name,
    Expression<String>? emailAddress,
    Expression<String?>? password,
    Expression<String?>? profilePic,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (emailAddress != null) 'email_address': emailAddress,
      if (password != null) 'password': password,
      if (profilePic != null) 'profile_pic': profilePic,
    });
  }

  MembersCompanion copyWith(
      {Value<String>? name,
      Value<String>? emailAddress,
      Value<String?>? password,
      Value<String?>? profilePic}) {
    return MembersCompanion(
      name: name ?? this.name,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (emailAddress.present) {
      map['email_address'] = Variable<String>(emailAddress.value);
    }
    if (password.present) {
      map['password'] = Variable<String?>(password.value);
    }
    if (profilePic.present) {
      map['profile_pic'] = Variable<String?>(profilePic.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersCompanion(')
          ..write('name: $name, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('password: $password, ')
          ..write('profilePic: $profilePic')
          ..write(')'))
        .toString();
  }
}

class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _emailAddressMeta =
      const VerificationMeta('emailAddress');
  @override
  late final GeneratedColumn<String?> emailAddress = GeneratedColumn<String?>(
      'email_address', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _profilePicMeta = const VerificationMeta('profilePic');
  @override
  late final GeneratedColumn<String?> profilePic = GeneratedColumn<String?>(
      'profile_pic', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [name, emailAddress, password, profilePic];
  @override
  String get aliasedName => _alias ?? 'members';
  @override
  String get actualTableName => 'members';
  @override
  VerificationContext validateIntegrity(Insertable<Member> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email_address')) {
      context.handle(
          _emailAddressMeta,
          emailAddress.isAcceptableOrUnknown(
              data['email_address']!, _emailAddressMeta));
    } else if (isInserting) {
      context.missing(_emailAddressMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    if (data.containsKey('profile_pic')) {
      context.handle(
          _profilePicMeta,
          profilePic.isAcceptableOrUnknown(
              data['profile_pic']!, _profilePicMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {emailAddress};
  @override
  Member map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Member.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MembersTable members = $MembersTable(this);
  late final MembersDao membersDao = MembersDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [members];
}
