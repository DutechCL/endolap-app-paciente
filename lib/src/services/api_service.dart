// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiService {
  final Dio dio = Dio();
  final GetStorage storage = GetStorage();
  final String _baseUrl = 'https://endolap.dutech.cl/api/v1';

  ApiService();

   Future<Response> getWithToken(String path, {Map<String, dynamic>? queryParameters}) async {
    final token = storage.read('token');

    if (token == null) {
      throw Exception('No se encontró un token almacenado');
    }

    final options = Options(headers: {'Authorization': 'Bearer $token'});

    try {
      final response = await dio.get(_baseUrl + path, queryParameters: queryParameters, options: options);
      return response;
    } catch (error) {
      print(error.toString());
      return Response(statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> postWithToken(String path, dynamic data) async {
    final token = storage.read('token');
    
    if (token == null) {
      throw Exception('No se encontró un token almacenado');
    }

    final options = Options(headers: {'Authorization': 'Bearer $token'});

    try {
      final response = await dio.post(_baseUrl + path, data: data, options: options);
      return response;
    } catch (error) {
      print(error.toString());
      return Response(statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> putWithToken(String path, dynamic data) async {
    final token = storage.read('token');
    
    if (token == null) {
      throw Exception('No se encontró un token almacenado');
    }

    final options = Options(headers: {'Authorization': 'Bearer $token'});

    try {
      final response = await dio.put(_baseUrl + path, data: data, options: options);
      return response;
    } catch (error) {
      print(error.toString());
      return Response(statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(_baseUrl + path, queryParameters: queryParameters);
      return response;
    } catch (error) {
      print(error.toString());
      return Response(statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await dio.post(_baseUrl + path, data: data);
      return response;
    } catch (error) {
      print(error.toString());
      return Response(statusCode: 500, requestOptions: RequestOptions(path: ''));
    }
  }
}
