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
    required int perPage,
  }) async {
    try {
      Response response = await _dio.get(
        'users',
        queryParameters: <String, dynamic>{
          'page': page,
          'per_page': perPage,
        },
      );
      return User.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
