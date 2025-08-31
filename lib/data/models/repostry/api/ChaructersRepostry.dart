import 'package:project_bloc/data/models/repostry/api/CarcterWebServise.dart';

import 'Carcters.dart';

class ChaructersRepostry {
  final CarcterWebServise carcterWebServise;

  ChaructersRepostry(this.carcterWebServise);
  Future<List<Caracter>> getAllCharactars() async {
    final charcter = await carcterWebServise.getAllCharactars();
    return charcter.map((charcter) => Caracter.fromJson(charcter)).toList();
  }
}
