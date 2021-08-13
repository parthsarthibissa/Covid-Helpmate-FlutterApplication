import 'package:dio/dio.dart';
import 'package:myapp2/models/worldModel.dart';

class WorldService {
  static const url = 'https://disease.sh/v3/covid-19/all';

  Future<WorldModel> getWorldApi() async {
    Dio dio = Dio();
    try {
      Response res = await dio
          .get(url, queryParameters: {'yesterday': true, 'strict': true});
      WorldModel model = WorldModel.fromJson(res.data);
      return model;
    } catch (e) {
      print('catched' + e);
      return null;
    }
  }
}
