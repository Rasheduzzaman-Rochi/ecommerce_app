import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final String errorMessage;
  final bool isSuccess;

  NetworkResponse({
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went wrong!',
    required this.isSuccess,
  });
}

class NetworkCaller {
  final Logger _logger = Logger();

  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {'token': ''};

      _logRequest(url, headers);

      Response response = await get(uri, headers: headers);
      _logResponse(url, response);
      final decodeResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: decodeResponse,
          isSuccess: true,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodeResponse['msg'],
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodeResponse['msg'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'token': '',
      };
      _logRequest(url, headers);
      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);
      final decodeResponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: decodeResponse,
          isSuccess: true,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodeResponse['msg'],
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodeResponse['msg'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> putRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'token': '',
      };
      _logRequest(url, headers);
      Response response = await put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: decodeResponse,
          isSuccess: true,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'token': '',
      };
      _logRequest(url, headers);
      Response response = await patch(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: decodeResponse,
          isSuccess: true,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> deleteRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'token': '',
      };
      _logRequest(url, headers);
      Response response = await delete(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          responseData: decodeResponse,
          isSuccess: true,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url,
    Map<String, dynamic> headers, {
    Map<String, dynamic>? requestBody,
  }) {
    _logger.i('URL: $url\nHeaders: $headers\nBody: $requestBody');
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      'URL => $url\nStatus Code: $response.statusCoe\nHeaders: ${response.headers}\nBody: ${response.body}',
    );
  }
}
