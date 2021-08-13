import 'package:dio/dio.dart';
import 'package:myapp2/models/indiaModel.dart';

class IndiaService {
  static const url = 'https://disease.sh/v3/covid-19/countries/india';

  Future<IndiaModel> getIndiaApi() async {
    Dio dio = Dio();
    try {
      Response res = await dio
          .get(url, queryParameters: {'yesterday': true, 'strict': true});
      IndiaModel model = IndiaModel.fromJson(res.data);
      return model;
    } catch (e) {
      print('catched' + e);
      return null;
    }
  }
}
