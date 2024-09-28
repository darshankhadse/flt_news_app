import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import 'api_urls.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() {
    return _instance;
  }

  NetworkService._internal();

  final String baseUrl = ApiUrls.baseUrl;

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Future<dynamic> _executeApiCall(
    Future<http.Response> Function() apiCall,
  ) async {
    if (await checkInternetConnection()) {
      try {
        final response = await apiCall();
        return _handleResponse(response);
      } catch (e) {
        return _handleError(e);
      }
    } else {
      return 'No internet connection';
    }
  }

  Future<dynamic> get(String endpoint, Map<String, String>? queryParams) async {
    return await _executeApiCall(() => http.get(
        Uri.parse('$baseUrl/$endpoint').replace(queryParameters: queryParams)));
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    return await _executeApiCall(() => http.post(
          Uri.parse('$baseUrl/$endpoint'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        ));
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Error: ${response.statusCode}, ${response.reasonPhrase}';
    }
  }

  dynamic _handleError(e) {
    return 'Request failed: $e';
  }
}
