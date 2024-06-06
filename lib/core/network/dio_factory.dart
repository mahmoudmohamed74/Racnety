// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:parking_app/core/network/api_constants.dart';
import 'package:parking_app/core/utils/app_pref.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANG = "language";
/////
const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String acceptAll = '*/*';
const String authorization = 'Authorization';
const String connection = 'Connection';
const String keepAlive = 'keep-alive';
const String acceptEncoding = 'Accept-Encoding';
const String acceptEncodingType = 'gzip, deflate, br';
const String username = '11170654';
const String password = '60-dayfreetrial';

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Map<String, String> headers = {
    CONTENT_TYPE: APPLICATION_JSON,
    ACCEPT: APPLICATION_JSON,
    AUTHORIZATION: ApiConstants.token,
    // DEFAULT_LANG: language,
  };

  Future<Response> getReq({
    required String endPoint,
    data,
    String? token,
  }) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: (object) {
          debugPrint(object.toString());
        },
      ),
    );

    dio.options.headers = {
      "Authorization": "Bearer ${await _appPreferences.getUserToken()}",
    };

    return await dio.get(
      endPoint,
      data: data,
    );
  }

  Future<Response> postReq({
    required String endPoint,
    data,
    String? token,
    String? contentType,
  }) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        // connectTimeout: const Duration(seconds: 900),
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: (object) {
          debugPrint(object.toString());
        },
      ),
    );

    dio.options.headers = {
      "Authorization": "Bearer ${await _appPreferences.getUserToken()}",
    };

    return await dio.post(
      endPoint,
      data: data,
    );
  }

  Future<Response> putReq({
    required String endPoint,
    data,
    String? token,
    String? contentType,
  }) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: (object) {
          debugPrint(object.toString());
        },
      ),
    );

    dio.options.headers = {
      "Authorization": "Bearer ${await _appPreferences.getUserToken()}",
    };
    return await dio.put(
      endPoint,
      data: data,
    );
  }

  Future<Response> deleteReq({
    required String endPoint,
    data,
    String? token,
    String? contentType,
  }) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: (object) {
          debugPrint(object.toString());
        },
      ),
    );
    dio.options.headers = {
      "Authorization": "Bearer ${await _appPreferences.getUserToken()}",
    };

    return await dio.delete(
      endPoint,
      data: data,
    );
  }
}
