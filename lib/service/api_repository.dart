
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:poke_app/core/constraint/const.dart';
import 'package:poke_app/service/api_service.dart';

class ApiRepository{
  late final Dio _dio;
  late final ApiService _apiService;


  ApiRepository(){
    _dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      contentType: "application/json"
    ))..interceptors.add(HttpFormatter());

    _apiService = ApiService(_dio, baseUrl: baseUrl);
  }

  ApiService get apiService => _apiService;

}