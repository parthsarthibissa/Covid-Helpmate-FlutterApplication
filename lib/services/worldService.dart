import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp2/models/worldModel.dart';

class WorldService {
  static const url = 'https://disease.sh/v3/covid-19/all';

  Future<WorldModel> getWorldApi(BuildContext context) async {
    Dio dio = Dio();
    try {
      Response res = await dio.get(url, queryParameters: {
        'yesterday': true,
        'strict': true
      }).catchError((onError) {
        Fluttertoast.showToast(msg: 'Something went wrong!');
      });
      WorldModel model = WorldModel.fromJson(res.data);
      return model;
    } catch (e) {
      print('catched' + e);
      Fluttertoast.showToast(msg: 'Something went wrong!');
      return null;
    }
  }
}
