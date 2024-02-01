

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../errors/exception.dart';

import 'connection.dart';

class NetworkRequest {
  final Dio _dio = Dio()
    ..options = BaseOptions(
      validateStatus: (statusCode) => (statusCode ?? 500) != null,
    )
    ..interceptors.addAll(
      [
        PrettyDioLogger(
          request: !kReleaseMode,
          requestBody: !kReleaseMode,
          requestHeader: !kReleaseMode,
          error: !kReleaseMode,
          responseBody: !kReleaseMode,
          responseHeader: !kReleaseMode,
        ),
      ],
    );
  final NetworkInfo networkInfo;

  NetworkRequest({required this.networkInfo});

  Future<T> sendRequest<T>({
    required String method,
    required String url,
    dynamic body,
    Map<String, dynamic>? headers,
    T Function(dynamic)? fromJson,
  }) async {
    print("$url");
    print(headers);

    try {
      late Response response;

      switch (method) {
        case "GET":
          response = await _dio.get("$url",
              options: Options(headers: headers));
          break;
        case "POST":
          response = await _dio.post("$url",
              data: body, options: Options(headers: headers));
          break;
        case "PUT":
          response = await _dio.put("$url",
              data: body, options: Options(headers: headers));
          break;
        case "PATCH":
          response = await _dio.patch("$url",
              data: body, options: Options(headers: headers));
          break;
        case "DELETE":
          response = await _dio.delete("$url",
              options: Options(headers: headers));
          break;
        default:
          throw Exception("Unsupported HTTP method: $method");
      }

      print("pass ${response.statusCode}");
      if (response.statusCode! >= 200 && response.statusCode! <= 204) {
        if (fromJson != null) {
          return fromJson(response.data);
        }
        // else if (url.toString() == getAuthTokenUrl) {
        //   sharedPrefs.setAuthToken(response.data["bearerToken"]);
        //   print("SUCCESSFULLY SETTD UP ${response.data["bearerToken"]}");
        //   return tokenSetupSuccessText as T;
        // }
        else {
          return 'Status code: 200' as T;
        }
      }
      else if (response.statusCode == 401) {
        throw UnauthorizedException("Unauthorized: ${response.statusCode}");
      } else if (response.statusCode == 403) {
        throw ForbiddenException("Forbidden: ${response.statusCode}");
      } else if (response.statusCode == 404) {
        throw NotFoundException("Not Found: ${response.statusCode}");
      } else if (response.statusCode! >= 500) {
        throw ServerErrorException("Server Error: ${response.statusCode}");
      } else {
        print("SIUUzsds11");
        throw DioException(
          requestOptions: response.requestOptions,
          response: Response(
            requestOptions: response.requestOptions,
            data: response.data,
          ),
          error: "HTTP ${response.statusCode}",
        );
      }
    } on DioException catch (error) {
      // if (url.contains(getUserByEmailUrl) &&
      //     error.response!.statusCode == 404) {
      //   return fromJson!(error.response?.data);
      // }

        throw _handleError(error);

    } catch (error) {
      throw error;
    }
  }

  Exception _handleError(DioException error) {
    String message = "An error occurred";
    if (error.response != null && error.response!.data != null) {
      message = error.response!.data.toString();
    }
    return error;
  }
}
