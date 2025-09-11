import 'package:dio/dio.dart';
import 'package:project_bloc/constance/Strings.dart';

class CaracterWebServise {
  late Dio dio;

  CaracterWebServise() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharactars() async {
    try {
      Response response = await dio.get('character');
      print(response.data);
      return response.data["results"];
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
