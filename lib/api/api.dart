import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/candle.dart';
import '../models/candles_payload.dart';
import '../models/get_candles_request.dart';

class Api {
  final Dio _dio;

  Api(this._dio);

  static Dio buildDefaultHttpClient(String apiKey) {
    final dio = Dio();
    dio.options.baseUrl = "https://finnhub.io/api";
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters.addAll({
          "token": apiKey,
        });

        return handler.next(options);
      },
    ));

    return dio;
  }

  Future<List<Candle>> getCandles(GetCandlesRequest request) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        "/v1/stock/candle",
        queryParameters: request.toJson(),
      );

      final candlesPayload = CandlesPayload.fromJson(response.data!);
      return candlesPayload.toCandles();
    } catch (e, s) {
      debugPrint("$e\n$s");
      throw ApiException("An unknown error occurred");
    }
  }
}

class ApiException {
  final String message;
  ApiException(this.message);
}
