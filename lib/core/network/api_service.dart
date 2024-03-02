import 'package:dio/dio.dart';
import 'package:racnety/core/network/api_constants.dart';

import 'dio_factory.dart';

class ApiService {
  final Dio _dio;

  ApiService(
    this._dio,
  );
  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('${ApiConstants.baseUrl}$endPoint');
    return response.data;
  }
}

abstract class BaseTestApi {
  Future<void> testFinger({required String endPoint, dynamic data});
}

class TestApiImpl implements BaseTestApi {
  final DioFactory dioFactory;

  TestApiImpl(this.dioFactory);
  @override
  Future<void> testFinger({required String endPoint, data}) async {
    await dioFactory.postReq(endPoint: endPoint, data: data);
  }
}
