import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:qdesc_test/data/network/endpoint.dart';

import '../models/customer.dart';

class ApiClient {
  var dio = Dio();

  Future<AuthSuccess> getToken(String email, String password) async {
    try {
      final response = await dio.post(Endpoint.loginUrl, data: {
        'email': email,
        'password': password,
      });
      print(response.data);
      print(response.headers);
      print(response.statusMessage);


      return AuthSuccess.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response);
      throw e.response!.data[0]['description'];
    }
  }

  Future<List<Customer>> getData(
      {required Map<String, dynamic> headers}) async {
    try {
      final response = await dio.get(Endpoint.customersUrl, options: Options(headers: headers));
      print(jsonDecode(response.data));
      var res = json.decode(response.data);
      return (res as List<dynamic>).map((e) => Customer.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e.response);
      throw e.response!.data[0]['description'];
    }
  }
}

class AuthSuccess {
  final String token;

  AuthSuccess.fromJson(
    dynamic json,
  ) : token = json['access_token'];
}
