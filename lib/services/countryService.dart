import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp2/models/countryModel.dart';

class CountryService {
  final String country;
  CountryService({this.country});
  String url = 'https://disease.sh/v3/covid-19/countries/';
  Dio dio = Dio();
  Future<CountryModel> getCountryApi() async {
    try {
      Response res = await dio.get(url + country, queryParameters: {
        'yesterday': true,
        'strict': true,
      }).catchError((onError) {
        Fluttertoast.showToast(msg: 'Something went wrong!');
      });
      CountryModel model = CountryModel.fromJson(res.data);
      return model;
    } catch (e) {
      print("E" + e.toString());
      Fluttertoast.showToast(msg: 'Something went wrong!');
      return null;
    }
  }
}
