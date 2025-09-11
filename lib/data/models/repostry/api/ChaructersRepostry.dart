import 'package:project_bloc/data/models/repostry/api/CarcterWebServise.dart';

import 'Carcters.dart';

class CharauctersRepostry {
  final CaracterWebServise caracterWebServise;

  CharauctersRepostry(this.caracterWebServise);
  Future<List<Caracter>> getAllCharactars() async {
    final caracter = await caracterWebServise.getAllCharactars();
    return caracter.map((caracter) => Caracter.fromJson(caracter)).toList();
  }
}
