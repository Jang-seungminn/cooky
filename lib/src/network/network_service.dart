import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'network_helper.dart';

enum RequestType { get, put, post }

class NetworkService {
  const NetworkService._();

  // static Map<String, String> _getHeaders() => {
  //       'Content-Type': 'application/json',
  //     };

  static Future<http.Response>? _createRequest({
    required RequestType requestType,
    required Uri uri,
    // Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    if (requestType == RequestType.get) {
      return http.get(
        uri,
      );
    }
    return null;
  }

  static Future<http.Response?>? sendRequest({
    required RequestType requestType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? queryParam,
  }) async {
    try {
      // final _header = _getHeaders();
      final responseUrl = NetworkHelper.concatUrlQP(url, queryParam);

      final response = await _createRequest(
          requestType: requestType,
          uri: Uri.parse(responseUrl),
          // headers: _header,
          body: body);

      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error - $e');
      }
      return null;
    }
  }
}
