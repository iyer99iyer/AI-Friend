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

class Conversation extends DataClass implements Insertable<Conversation> {
  final int id;
  final String sentence;
  final String type;
  final String option;
  final bool? done;
  final DateTime conversationDateTime;
  Conversation(
      {required this.id,
      required this.sentence,
      required this.type,
      required this.option,
      this.done,
      required this.conversationDateTime});
  factory Conversation.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Conversation(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      sentence: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sentence'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      option: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}option'])!,
      done: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}done']),
      conversationDateTime: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}conversation_date_time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sentence'] = Variable<String>(sentence);
    map['type'] = Variable<String>(type);
    map['option'] = Variable<String>(option);
    if (!nullToAbsent || done != null) {
      map['done'] = Variable<bool?>(done);
    }
    map['conversation_date_time'] = Variable<DateTime>(conversationDateTime);
    return map;
  }

  ConversationsCompanion toCompanion(bool nullToAbsent) {
    return ConversationsCompanion(
      id: Value(id),
      sentence: Value(sentence),
      type: Value(type),
      option: Value(option),
      done: done == null && nullToAbsent ? const Value.absent() : Value(done),
      conversationDateTime: Value(conversationDateTime),
    );
  }

  factory Conversation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Conversation(
      id: serializer.fromJson<int>(json['id']),
      sentence: serializer.fromJson<String>(json['sentence']),
      type: serializer.fromJson<String>(json['type']),
      option: serializer.fromJson<String>(json['option']),
      done: serializer.fromJson<bool?>(json['done']),
      conversationDateTime:
          serializer.fromJson<DateTime>(json['conversationDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sentence': serializer.toJson<String>(sentence),
      'type': serializer.toJson<String>(type),
      'option': serializer.toJson<String>(option),
      'done': serializer.toJson<bool?>(done),
      'conversationDateTime': serializer.toJson<DateTime>(conversationDateTime),
    };
  }

  Conversation copyWith(
          {int? id,
          String? sentence,
          String? type,
          String? option,
          bool? done,
          DateTime? conversationDateTime}) =>
      Conversation(
        id: id ?? this.id,
        sentence: sentence ?? this.sentence,
        type: type ?? this.type,
        option: option ?? this.option,
        done: done ?? this.done,
        conversationDateTime: conversationDateTime ?? this.conversationDateTime,
      );
  @override
  String toString() {
    return (StringBuffer('Conversation(')
          ..write('id: $id, ')
          ..write('sentence: $sentence, ')
          ..write('type: $type, ')
          ..write('option: $option, ')
          ..write('done: $done, ')
          ..write('conversationDateTime: $conversationDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sentence, type, option, done, conversationDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Conversation &&
          other.id == this.id &&
          other.sentence == this.sentence &&
          other.type == this.type &&
          other.option == this.option &&
          other.done == this.done &&
          other.conversationDateTime == this.conversationDateTime);
}

class ConversationsCompanion extends UpdateCompanion<Conversation> {
  final Value<int> id;
  final Value<String> sentence;
  final Value<String> type;
  final Value<String> option;
  final Value<bool?> done;
  final Value<DateTime> conversationDateTime;
  const ConversationsCompanion({
    this.id = const Value.absent(),
    this.sentence = const Value.absent(),
    this.type = const Value.absent(),
    this.option = const Value.absent(),
    this.done = const Value.absent(),
    this.conversationDateTime = const Value.absent(),
  });
  ConversationsCompanion.insert({
    this.id = const Value.absent(),
    required String sentence,
    required String type,
    required String option,
    this.done = const Value.absent(),
    required DateTime conversationDateTime,
  })  : sentence = Value(sentence),
        type = Value(type),
        option = Value(option),
        conversationDateTime = Value(conversationDateTime);
  static Insertable<Conversation> custom({
    Expression<int>? id,
    Expression<String>? sentence,
    Expression<String>? type,
    Expression<String>? option,
    Expression<bool?>? done,
    Expression<DateTime>? conversationDateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sentence != null) 'sentence': sentence,
      if (type != null) 'type': type,
      if (option != null) 'option': option,
      if (done != null) 'done': done,
      if (conversationDateTime != null)
        'conversation_date_time': conversationDateTime,
    });
  }

  ConversationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? sentence,
      Value<String>? type,
      Value<String>? option,
      Value<bool?>? done,
      Value<DateTime>? conversationDateTime}) {
    return ConversationsCompanion(
      id: id ?? this.id,
      sentence: sentence ?? this.sentence,
      type: type ?? this.type,
      option: option ?? this.option,
      done: done ?? this.done,
      conversationDateTime: conversationDateTime ?? this.conversationDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sentence.present) {
      map['sentence'] = Variable<String>(sentence.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (option.present) {
      map['option'] = Variable<String>(option.value);
    }
    if (done.present) {
      map['done'] = Variable<bool?>(done.value);
    }
    if (conversationDateTime.present) {
      map['conversation_date_time'] =
          Variable<DateTime>(conversationDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationsCompanion(')
          ..write('id: $id, ')
          ..write('sentence: $sentence, ')
          ..write('type: $type, ')
          ..write('option: $option, ')
          ..write('done: $done, ')
          ..write('conversationDateTime: $conversationDateTime')
          ..write(')'))
        .toString();
  }
}

class $ConversationsTable extends Conversations
    with TableInfo<$ConversationsTable, Conversation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _sentenceMeta = const VerificationMeta('sentence');
  @override
  late final GeneratedColumn<String?> sentence = GeneratedColumn<String?>(
      'sentence', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _optionMeta = const VerificationMeta('option');
  @override
  late final GeneratedColumn<String?> option = GeneratedColumn<String?>(
      'option', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool?> done = GeneratedColumn<bool?>(
      'done', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (done IN (0, 1))');
  final VerificationMeta _conversationDateTimeMeta =
      const VerificationMeta('conversationDateTime');
  @override
  late final GeneratedColumn<DateTime?> conversationDateTime =
      GeneratedColumn<DateTime?>('conversation_date_time', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sentence, type, option, done, conversationDateTime];
  @override
  String get aliasedName => _alias ?? 'conversations';
  @override
  String get actualTableName => 'conversations';
  @override
  VerificationContext validateIntegrity(Insertable<Conversation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sentence')) {
      context.handle(_sentenceMeta,
          sentence.isAcceptableOrUnknown(data['sentence']!, _sentenceMeta));
    } else if (isInserting) {
      context.missing(_sentenceMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('option')) {
      context.handle(_optionMeta,
          option.isAcceptableOrUnknown(data['option']!, _optionMeta));
    } else if (isInserting) {
      context.missing(_optionMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('conversation_date_time')) {
      context.handle(
          _conversationDateTimeMeta,
          conversationDateTime.isAcceptableOrUnknown(
              data['conversation_date_time']!, _conversationDateTimeMeta));
    } else if (isInserting) {
      context.missing(_conversationDateTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Conversation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Conversation.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ConversationsTable createAlias(String alias) {
    return $ConversationsTable(attachedDatabase, alias);
  }
}

class ConstConversation extends DataClass
    implements Insertable<ConstConversation> {
  final int id;
  final String sentence;
  final String type;
  final String option;
  final bool? done;
  final DateTime conversationDateTime;
  ConstConversation(
      {required this.id,
      required this.sentence,
      required this.type,
      required this.option,
      this.done,
      required this.conversationDateTime});
  factory ConstConversation.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ConstConversation(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      sentence: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sentence'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      option: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}option'])!,
      done: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}done']),
      conversationDateTime: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}conversation_date_time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sentence'] = Variable<String>(sentence);
    map['type'] = Variable<String>(type);
    map['option'] = Variable<String>(option);
    if (!nullToAbsent || done != null) {
      map['done'] = Variable<bool?>(done);
    }
    map['conversation_date_time'] = Variable<DateTime>(conversationDateTime);
    return map;
  }

  ConstConversationsCompanion toCompanion(bool nullToAbsent) {
    return ConstConversationsCompanion(
      id: Value(id),
      sentence: Value(sentence),
      type: Value(type),
      option: Value(option),
      done: done == null && nullToAbsent ? const Value.absent() : Value(done),
      conversationDateTime: Value(conversationDateTime),
    );
  }

  factory ConstConversation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConstConversation(
      id: serializer.fromJson<int>(json['id']),
      sentence: serializer.fromJson<String>(json['sentence']),
      type: serializer.fromJson<String>(json['type']),
      option: serializer.fromJson<String>(json['option']),
      done: serializer.fromJson<bool?>(json['done']),
      conversationDateTime:
          serializer.fromJson<DateTime>(json['conversationDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sentence': serializer.toJson<String>(sentence),
      'type': serializer.toJson<String>(type),
      'option': serializer.toJson<String>(option),
      'done': serializer.toJson<bool?>(done),
      'conversationDateTime': serializer.toJson<DateTime>(conversationDateTime),
    };
  }

  ConstConversation copyWith(
          {int? id,
          String? sentence,
          String? type,
          String? option,
          bool? done,
          DateTime? conversationDateTime}) =>
      ConstConversation(
        id: id ?? this.id,
        sentence: sentence ?? this.sentence,
        type: type ?? this.type,
        option: option ?? this.option,
        done: done ?? this.done,
        conversationDateTime: conversationDateTime ?? this.conversationDateTime,
      );
  @override
  String toString() {
    return (StringBuffer('ConstConversation(')
          ..write('id: $id, ')
          ..write('sentence: $sentence, ')
          ..write('type: $type, ')
          ..write('option: $option, ')
          ..write('done: $done, ')
          ..write('conversationDateTime: $conversationDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sentence, type, option, done, conversationDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConstConversation &&
          other.id == this.id &&
          other.sentence == this.sentence &&
          other.type == this.type &&
          other.option == this.option &&
          other.done == this.done &&
          other.conversationDateTime == this.conversationDateTime);
}

class ConstConversationsCompanion extends UpdateCompanion<ConstConversation> {
  final Value<int> id;
  final Value<String> sentence;
  final Value<String> type;
  final Value<String> option;
  final Value<bool?> done;
  final Value<DateTime> conversationDateTime;
  const ConstConversationsCompanion({
    this.id = const Value.absent(),
    this.sentence = const Value.absent(),
    this.type = const Value.absent(),
    this.option = const Value.absent(),
    this.done = const Value.absent(),
    this.conversationDateTime = const Value.absent(),
  });
  ConstConversationsCompanion.insert({
    this.id = const Value.absent(),
    required String sentence,
    required String type,
    required String option,
    this.done = const Value.absent(),
    required DateTime conversationDateTime,
  })  : sentence = Value(sentence),
        type = Value(type),
        option = Value(option),
        conversationDateTime = Value(conversationDateTime);
  static Insertable<ConstConversation> custom({
    Expression<int>? id,
    Expression<String>? sentence,
    Expression<String>? type,
    Expression<String>? option,
    Expression<bool?>? done,
    Expression<DateTime>? conversationDateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sentence != null) 'sentence': sentence,
      if (type != null) 'type': type,
      if (option != null) 'option': option,
      if (done != null) 'done': done,
      if (conversationDateTime != null)
        'conversation_date_time': conversationDateTime,
    });
  }

  ConstConversationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? sentence,
      Value<String>? type,
      Value<String>? option,
      Value<bool?>? done,
      Value<DateTime>? conversationDateTime}) {
    return ConstConversationsCompanion(
      id: id ?? this.id,
      sentence: sentence ?? this.sentence,
      type: type ?? this.type,
      option: option ?? this.option,
      done: done ?? this.done,
      conversationDateTime: conversationDateTime ?? this.conversationDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sentence.present) {
      map['sentence'] = Variable<String>(sentence.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (option.present) {
      map['option'] = Variable<String>(option.value);
    }
    if (done.present) {
      map['done'] = Variable<bool?>(done.value);
    }
    if (conversationDateTime.present) {
      map['conversation_date_time'] =
          Variable<DateTime>(conversationDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConstConversationsCompanion(')
          ..write('id: $id, ')
          ..write('sentence: $sentence, ')
          ..write('type: $type, ')
          ..write('option: $option, ')
          ..write('done: $done, ')
          ..write('conversationDateTime: $conversationDateTime')
          ..write(')'))
        .toString();
  }
}

class $ConstConversationsTable extends ConstConversations
    with TableInfo<$ConstConversationsTable, ConstConversation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConstConversationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _sentenceMeta = const VerificationMeta('sentence');
  @override
  late final GeneratedColumn<String?> sentence = GeneratedColumn<String?>(
      'sentence', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _optionMeta = const VerificationMeta('option');
  @override
  late final GeneratedColumn<String?> option = GeneratedColumn<String?>(
      'option', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool?> done = GeneratedColumn<bool?>(
      'done', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (done IN (0, 1))');
  final VerificationMeta _conversationDateTimeMeta =
      const VerificationMeta('conversationDateTime');
  @override
  late final GeneratedColumn<DateTime?> conversationDateTime =
      GeneratedColumn<DateTime?>('conversation_date_time', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sentence, type, option, done, conversationDateTime];
  @override
  String get aliasedName => _alias ?? 'const_conversations';
  @override
  String get actualTableName => 'const_conversations';
  @override
  VerificationContext validateIntegrity(Insertable<ConstConversation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sentence')) {
      context.handle(_sentenceMeta,
          sentence.isAcceptableOrUnknown(data['sentence']!, _sentenceMeta));
    } else if (isInserting) {
      context.missing(_sentenceMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('option')) {
      context.handle(_optionMeta,
          option.isAcceptableOrUnknown(data['option']!, _optionMeta));
    } else if (isInserting) {
      context.missing(_optionMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('conversation_date_time')) {
      context.handle(
          _conversationDateTimeMeta,
          conversationDateTime.isAcceptableOrUnknown(
              data['conversation_date_time']!, _conversationDateTimeMeta));
    } else if (isInserting) {
      context.missing(_conversationDateTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConstConversation map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ConstConversation.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ConstConversationsTable createAlias(String alias) {
    return $ConstConversationsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MembersTable members = $MembersTable(this);
  late final $ConversationsTable conversations = $ConversationsTable(this);
  late final $ConstConversationsTable constConversations =
      $ConstConversationsTable(this);
  late final MembersDao membersDao = MembersDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [members, conversations, constConversations];
}
