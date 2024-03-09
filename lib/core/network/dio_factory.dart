// ignore_for_file: constant_identifier_names, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:parking_app/core/network/api_constants.dart';
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

class DioFactory {
  // final AppPreferences _appPreferences;
  DioFactory(
      // this._appPreferences
      );

  Map<String, String> headers = {
    CONTENT_TYPE: APPLICATION_JSON,
    ACCEPT: APPLICATION_JSON,
    AUTHORIZATION: ApiConstants.token,
    // DEFAULT_LANG: language,
  };
  Future<Dio> getDio() async {
    Dio dio = Dio();
    // String language = await _appPreferences
    //     .getAppLanguage(); // get the saved lang that user saved in sheared pref

    dio.options = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: headers,
        receiveTimeout: const Duration(milliseconds: ApiConstants.appTimeOut),
        sendTimeout: const Duration(milliseconds: ApiConstants.appTimeOut));

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          responseHeader: true,
          requestBody: true,
        ),
      );
    }
    return dio;
  }

// CS5
  Future<Response> loginPost({
    required String endPoint,
    data,
    String? token,
  }) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        headers: headers,
        //  {
        //   'Accept-Encoding': 'gzip, deflate, br',
        //   'Connection': 'keep-alive',
        //   'Accept': '*/*',
        //   'content-type': 'application/x-www-form-urlencoded',
        // },
      ),
    );
    if (token != null) {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
      };
    }
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: (object) {
          debugPrint(object.toString());
        },
      ),
    );

    return await dio.post(
      ApiConstants.token,
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
      ),
    );
    // token =
    //     "vnJD83W7a7kfjushieVzByLTkaED8uBY6GU_eQLVUobneNCjxvgZE_HeRYWIeVb7kG21Ya9LI7AUb3BMkH2Xzqp7qBbIN-aKyo0ohHEcsvuPcRB4bqtuNjKEXasH_oo8NJORK_tIgKSIgJUKlCTF31F8-RtgXqUQ9n4yxCqSz0ZdW5C8-gsLzfi3IELOM0Qp593_hcbKB8BHpr7mV7jo9TcWNyp9-P58URBOD9iBWjnwx7W2w1eYKZ4_rl9oFhfkuFqGjLC5yinEuOj0B7G7TLs5ZZ7JdEkSkR2ngtjtRW-qC_ZCadU2zAJH4rj1UYbw0Q2hRiLTtuDHiSetdpeoO_u1qc3pH8--e8w9yAUE5emdrH4R3NSavk_oc3qpzmRo67ShMzTEiiCpfZppn0_SAvM5KVmpzrmZ4jpRbb2gHxp2wWQR9zmnA0NzpqGBqUIXGzURhcC5VgRpZ9smPsc_p06TnCmWaJrvrDSJDY1LpIFSJ4CBtv4Xyx_dhxnabWZCxfkk9DE9tXHNNzbgx8eCL0iZa1MtZ4Y0VCS1fpaN0go";

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

    // if (token != null) {
    //   dio.options.headers = {
    //     'Authorization': 'Bearer ${ApiConstants.token}',
    //   };
    // }
    dio.options.headers = {
      'Authorization': 'Bearer $token',
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

    // if (token != null) {
    //   dio.options.headers = {
    //     'Authorization': 'Bearer ${ApiConstants.token}',
    //   };
    // }
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };

    return await dio.put(
      endPoint,
      data: data,
    );
  }
}
