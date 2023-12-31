import 'package:realm/realm.dart';

part 'assemble.g.dart';

@RealmModel()
class _Binom {
  @PrimaryKey()
  late int id;
  late String ecole;
  late String filiere;
  late String cycle;
  late String anneeParrains;
  late String anneeFilleuls;
}

@RealmModel()
class _Parrains {
  @PrimaryKey()
  late int id;
  late String image;
  late List<_Binom> owner;
}

@RealmModel()
class _Filleuls {
  @PrimaryKey()
  late int id;
  late String image;
  late List<_Binom> owner;
}