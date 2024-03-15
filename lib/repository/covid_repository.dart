import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as ht;

import 'package:ninja_api/models/covid.dart';
import 'package:dio/dio.dart';

class CovidRepository {
  final dio = Dio();
  Future<Covid> fetchCategorieNewsApi(String country) async {
    List<Covid> covidList = [];
    final response = await ht.get(
      Uri.parse('https://api.api-ninjas.com/v1/covid19?country=canada'),
      headers: {'X-Api-Key': 'Qn8MyOnWPV041NejReU1tg==75jFbJD0SPKpXFjY'},
    );
    if (kDebugMode) {
      print(response.body);
    }

    // ignore: prefer_typing_uninitialized_variables
    var body;
    if (response.statusCode == 200) {
      body = jsonDecode(response.body);
    }
    // covidList.add(Covid.fromJson(body));
    return Covid.fromJson(body);
  }

  fetchDemo() async {
    // Dio dio = Dio(BaseOptions(
    //   baseUrl: 'https://api.api-ninjas.com/v1/validatephone?number=$country',
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'X-RapidAPI-Key': 'Qn8MyOnWPV041NejReU1tg==75jFbJD0SPKpXFjY',
    //     // Add other headers as needed
    //   },
    // ),);
    String country = 'canada';
    final _path = 'https://api.api-ninjas.com/v1/covid19?country=$country';
    final _options = Options(
      method: 'GET',
      headers: {
        'X-RapidAPI-Key': 'Qn8MyOnWPV041NejReU1tg==75jFbJD0SPKpXFjY',
      },
    );

    final _response = await dio.request<Object>(
      _path,
      options: _options,
    );
    if (kDebugMode) {
      print(_response);
    }
    var body = _response.data;
    return Covid.fromJson(_response.extra);
    // String apiKey = 'Qn8MyOnWPV041NejReU1tg==75jFbJD0SPKpXFjY';
    // String url =
    //     'https://api.api-ninjas.com/v1/covid19?country=$country?api_key=Qn8MyOnWPV041NejReU1tg==75jFbJD0SPKpXFjY';
    // final response = await ht.get(Uri.parse(url));
    // if (kDebugMode) {
    //   print(response.body);
    // }

    // // ignore: prefer_typing_uninitialized_variables
    // var body;
    // if (response.statusCode == 200) {
    //   body = jsonDecode(response.body);
    // }
    // return Covid.fromJson(body);
  }

  Future<Covid> fetchData() async {
    var country = 'canada';
    var url = 'https://api.api-ninjas.com/v1/covid19?country=' + country;
    var headers = {'X-Api-Key': 'Qn8MyOnWPV041NejReU1tg==75jFbJD0SPKpXFjY'};
    var response;
    var result;
    try {
      response = await HttpClient()
          .getUrl(Uri.parse(url))
          .then((HttpClientRequest request) {
        headers.forEach((key, value) {
          request.headers.add(key, value);
        });
        return request.close();
      });

      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        result = json.decode(responseBody);
        print(result);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return Covid.fromJson(result);
  }
}
