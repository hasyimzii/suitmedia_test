import 'dart:math';

import 'package:dio/dio.dart';
import '../common/constant.dart';
import '../models/user.dart';

class UserApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future getUser({
    required int page,
  }) async {
    try {
      Response response = await _dio.get(
        '/users',
        queryParameters: <String, dynamic>{
          'page': page,
          'per_page': 6,
        },
      );
      return User.fromMap(response.data);
    } catch (e) {
      return e;
    }
  }
}
