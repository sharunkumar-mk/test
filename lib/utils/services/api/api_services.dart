import 'package:dio/dio.dart';
import 'package:test_app/constants/api_path.dart';
import 'api_exceptions.dart';

class RestAPIService {
  final Dio _dio;
  RestAPIService(this._dio);

  getService({required String url}) async {
    String fetchUrl;
    try {
      if (url.contains("http")) {
        fetchUrl = url;
      } else {
        fetchUrl = TestAppAPI.baseUrl + url;
      }
      var response = await _dio.get(fetchUrl);
      return response.data;
      // ignore: deprecated_member_use
    } on DioError catch (dioError) {
      throw RestAPIException.fromDioError(dioError);
    }
  }
}
