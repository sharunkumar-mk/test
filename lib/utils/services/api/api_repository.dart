import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_app/constants/api_path.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/utils/services/api/api_services.dart';

class ApiRepository {
  Future<UserModel> fetchUsers() async {
    RestAPIService restAPIService = RestAPIService(Dio());
    var result = await restAPIService.getService(url: TestAppAPI.users);
    return compute(userModelFromjson, result);
  }
}
