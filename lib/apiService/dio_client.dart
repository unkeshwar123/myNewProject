

import 'package:dio/dio.dart';

Dio dioClient() {
  final dio = Dio();
  dio.options.headers['X-Desidime-Client'] = '08b4260e5585f282d1bd9d085e743fd9';
  // Add any global configurations for Dio client here
  return dio;
}
