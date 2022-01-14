import 'package:dio/dio.dart';
import '../config/constant.dart';
import '../models/user.dart';

class UserApi {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future<User?> getUser() async {
    try {
      Response response = await _dio.get(
        '/users',
        queryParameters: <String, dynamic>{
          'per_page': 6,
        },
      );
      return User.fromMap(response.data);
    } catch (e) {
      return null;
    }
  }
}
