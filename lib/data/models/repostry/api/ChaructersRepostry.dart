import 'package:project_bloc/data/models/repostry/api/CarcterWebServise.dart';

import 'Carcters.dart';

class Chaructersrepostry {
  final CarcterWebServise carcterWebServise;

  Chaructersrepostry(this.carcterWebServise);
  Future<List<dynamic>> consgetAllCharactars() async {
    final charcter = await carcterWebServise.getAllCharactars();
    return charcter.map((charcter) => Carcters.fromJson(charcter)).toList();
  }
}
