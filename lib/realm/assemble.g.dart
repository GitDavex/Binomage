// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assemble.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Binom extends _Binom with RealmEntity, RealmObjectBase, RealmObject {
  Binom(
    int id,
    String ecole,
    String filiere,
    String cycle,
    String anneeParrains,
    String anneeFilleuls,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'ecole', ecole);
    RealmObjectBase.set(this, 'filiere', filiere);
    RealmObjectBase.set(this, 'cycle', cycle);
    RealmObjectBase.set(this, 'anneeParrains', anneeParrains);
    RealmObjectBase.set(this, 'anneeFilleuls', anneeFilleuls);
  }

  Binom._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get ecole => RealmObjectBase.get<String>(this, 'ecole') as String;
  @override
  set ecole(String value) => RealmObjectBase.set(this, 'ecole', value);

  @override
  String get filiere => RealmObjectBase.get<String>(this, 'filiere') as String;
  @override
  set filiere(String value) => RealmObjectBase.set(this, 'filiere', value);

  @override
  String get cycle => RealmObjectBase.get<String>(this, 'cycle') as String;
  @override
  set cycle(String value) => RealmObjectBase.set(this, 'cycle', value);

  @override
  String get anneeParrains =>
      RealmObjectBase.get<String>(this, 'anneeParrains') as String;
  @override
  set anneeParrains(String value) =>
      RealmObjectBase.set(this, 'anneeParrains', value);

  @override
  String get anneeFilleuls =>
      RealmObjectBase.get<String>(this, 'anneeFilleuls') as String;
  @override
  set anneeFilleuls(String value) =>
      RealmObjectBase.set(this, 'anneeFilleuls', value);

  @override
  Stream<RealmObjectChanges<Binom>> get changes =>
      RealmObjectBase.getChanges<Binom>(this);

  @override
  Binom freeze() => RealmObjectBase.freezeObject<Binom>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Binom._);
    return const SchemaObject(ObjectType.realmObject, Binom, 'Binom', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('ecole', RealmPropertyType.string),
      SchemaProperty('filiere', RealmPropertyType.string),
      SchemaProperty('cycle', RealmPropertyType.string),
      SchemaProperty('anneeParrains', RealmPropertyType.string),
      SchemaProperty('anneeFilleuls', RealmPropertyType.string),
    ]);
  }
}

class Parrains extends _Parrains
    with RealmEntity, RealmObjectBase, RealmObject {
  Parrains(
    int id,
    String image, {
    Iterable<Binom> owner = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set<RealmList<Binom>>(
        this, 'owner', RealmList<Binom>(owner));
  }

  Parrains._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  RealmList<Binom> get owner =>
      RealmObjectBase.get<Binom>(this, 'owner') as RealmList<Binom>;
  @override
  set owner(covariant RealmList<Binom> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Parrains>> get changes =>
      RealmObjectBase.getChanges<Parrains>(this);

  @override
  Parrains freeze() => RealmObjectBase.freezeObject<Parrains>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Parrains._);
    return const SchemaObject(ObjectType.realmObject, Parrains, 'Parrains', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('image', RealmPropertyType.string),
      SchemaProperty('owner', RealmPropertyType.object,
          linkTarget: 'Binom', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Filleuls extends _Filleuls
    with RealmEntity, RealmObjectBase, RealmObject {
  Filleuls(
    int id,
    String image, {
    Iterable<Binom> owner = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set<RealmList<Binom>>(
        this, 'owner', RealmList<Binom>(owner));
  }

  Filleuls._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  RealmList<Binom> get owner =>
      RealmObjectBase.get<Binom>(this, 'owner') as RealmList<Binom>;
  @override
  set owner(covariant RealmList<Binom> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Filleuls>> get changes =>
      RealmObjectBase.getChanges<Filleuls>(this);

  @override
  Filleuls freeze() => RealmObjectBase.freezeObject<Filleuls>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Filleuls._);
    return const SchemaObject(ObjectType.realmObject, Filleuls, 'Filleuls', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('image', RealmPropertyType.string),
      SchemaProperty('owner', RealmPropertyType.object,
          linkTarget: 'Binom', collectionType: RealmCollectionType.list),
    ]);
  }
}
