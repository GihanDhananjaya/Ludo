import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'mock_models.dart';
import 'network_config.dart';

class MockAPIHelper {
  Future<dynamic> post(String url, {@required body}) async {
    final dio = Dio();
    final adapter = DioAdapter(dio: dio);
    adapter.onPost(NetworkConfig.getNetworkUrl() + url, (request) {
      final response = _getResponse(url);
      return request.reply(
        200,
        json.decode(response),
      );
    }, data: body);

    dio.options.headers['content-Type'] = 'application/json';
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: false,
        responseBody: true,
        responseHeader: false,
      ),
    );

    final response = await dio.post(NetworkConfig.getNetworkUrl() + url,
        data: body, options: Options());
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }

  _getResponse(String url) {
    if (url == 'user/register') {
      return MockModels.userRegisterResponse;
    }else if (url == 'user/verify') {
      return MockModels.userVerificationResponse;
    }else if (url == 'otp/generate') {
      return MockModels.otpGenerateResponse;
    }else if (url == 'otp/submit') {
      return MockModels.otpSubmitResponse;
    }else if (url == 'user/data') {
      return MockModels.authUserResponse;
    }else if (url == 'rank/top') {
      return MockModels.topRankResponse;
    }else if (url == 'master/get') {
      return MockModels.masterDataResponse;
    }
  }
}
