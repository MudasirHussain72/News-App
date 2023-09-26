import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:news_app/data/remote/app_exception.dart';
import 'package:news_app/data/remote/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTomeOutException {
      throw RequestTomeOutException();
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw FetchDataException(
            'Something went wrong please try again later.');
      default:
        throw FetchDataException(
            'Error Occured while communicating with server ${response.statusCode}');
    }
  }

  // Response exception for images
  dynamic returnMultipartResponse(http.StreamedResponse response) async {
    final responseBody = await response.stream.bytesToString();
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(responseBody);
        return responseJson;
      case 400:
        throw FetchDataException(
            'Something went wrong please try again later.');
      default:
        throw FetchDataException(
            'Error accoured while communicating with server ${response.statusCode}');
    }
  }
}
