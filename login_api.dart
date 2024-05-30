import 'dart:developer';
import 'package:dio/dio.dart';

class LoginService {
  static Future<dynamic> postData(dynamic data, var headers) async {
    const url = "https://api.realestate.salonsyncs.com/graphql";
    try {
      var response = await Dio().post(
        url,
        options: Options(headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        var decodedData = response.data;
        return decodedData;
      } else {
        log("Else Condition -> Api failed->${response.statusCode}");
        return response.data;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }
}
