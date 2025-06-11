// services/api_service.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lcdc_mobile_app/modal/ResponseModal/login_res.dart';
import 'package:path/path.dart';

class ApiService {
  Dio dio = Dio();

  ///
  // Get method (for example purposes)
  ///

  Future<http.Response> get(String endpoint, {String? token}) async {
    try {
      var response = await http.get(
        Uri.parse(endpoint),
        headers: {'Authorization': 'Bearer $token'},
      );

      // Handle non-2xx response status
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(response);
        return response;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error making GET request: $e');
    }
  }

  ///
  // Dio  Get Method
  ///

  Future<Map<String, dynamic>> getData(String url, {String? token}) async {
    print("📡 Requesting URL: $url");
    print("🔐 Token: $token");

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
          validateStatus:
              (status) =>
                  status != null && status < 500, // Let 400 be handled manually
        ),
      );

      print("📥 Response status code: ${response.statusCode}");
      print("📥 Response data: ${response.data}");

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          return response.data;
        } else {
          return jsonDecode(response.data);
        }
      } else {
        return {
          "error": true,
          "status": response.statusCode,
          "message":
              response.data is String
                  ? response.data
                  : response.data.toString(),
        };
      }
    } on DioException catch (e) {
      print("❌ DioException: ${e.message}");

      return {
        "error": true,
        "message": e.message,
        "type": e.type.toString(),
        "details": e.response?.data ?? "No response body",
        "status": e.response?.statusCode,
      };
    } catch (e) {
      print("❌ General Exception: $e");

      return {
        "error": true,
        "message": "Unexpected error occurred",
        "details": e.toString(),
      };
    }
  }

  ///
  /// http post method
  ///

  Future<Map<String, dynamic>> post(
    String url,
    Map<String, dynamic> data,
  ) async {
    final response = await http.post(
      Uri.parse(url),

      // body: data,
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        // 'Content-Type': 'application/x-www-form-urlencoded',
        'x-api-key': 'reqres-free-v1',
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (kDebugMode) {
        debugPrint("${response.request}\n${response.body}");
      }
      return jsonDecode(response.body);
    } else {
      throw Exception('POST Error [${response.statusCode}]: ${response.body}');
    }
  }
  //

  deleteApi(String url) async {
    final response = await http.delete(Uri.parse(url));
  }

  Future<void> uploadData({String? file}) async {
    final url = Uri.parse('https://your-api-endpoint.com/upload');

    // Create the multipart request
    final request = http.MultipartRequest('POST', url);

    // Add form fields
    request.fields['name'] = 'John Doe';
    request.fields['rollNo'] = '12345';
    request.fields['age'] = '25';

    // Add one or more files

    request.files.add(
      await http.MultipartFile.fromPath(
        'file', // name expected by backend (like $_FILES['file'] in PHP)
        file!,
      ),
    );

    // Optional: Add headers (e.g., authorization)
    request.headers.addAll({
      'Authorization': 'Bearer YOUR_TOKEN_HERE',
      'Accept': 'application/json',
    });

    // Send the request
    final response = await request.send();

    // Handle the streamed response
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      print('Upload success: $responseBody');
    } else {
      print('Upload failed with status: ${response.statusCode}');
      final errorBody = await response.stream.bytesToString();
      print('Error: $errorBody');
    }
  }

  //dio post

  // Future<Map<String, dynamic>> postApi(
  //   String url,
  //   Map<String, dynamic>? request,
  // ) async {
  //   debugPrint("REQUEST DATA==>    ${request.toString()}");

  //   var response = await dio.post(url, data: request);

  //   try {
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Map<String, dynamic> jsonResponse = response.data;
  //       return jsonResponse;
  //     }else{

  //     }
  //   } catch (e) {
  //     DioException(requestOptions: RequestOptions(contentType: e.toString()));
  //   }
  //   return {};
  // }
  Future<Map<String, dynamic>> postApi(
    String url,
    Map<String, dynamic>? request,
  ) async {
    debugPrint("REQUEST DATA ==> ${request.toString()}");

    try {
      final response = await dio.post(url, data: request);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return {
          "status": false,
          "message": "Unexpected error: ${response.statusCode}",
        };
      }
    } on DioException catch (e) {
      String errorMessage = "Something went wrong";

      if (e.type == DioExceptionType.badResponse) {
        final res = e.response;
        if (res != null && res.statusCode == 400) {
          // Extract first validation message
          final data = res.data;
          if (data is Map && data['messages'] is Map) {
            final messages = data['messages'] as Map;
            final firstKey = messages.keys.first;
            final firstMessage = messages[firstKey];
            errorMessage = firstMessage.toString();
          }
        } else {
          errorMessage = "Server error: ${res?.statusCode}";
        }
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timeout. Please try again.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Receive timeout. Please try again.";
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = "Send timeout. Please try again.";
      } else if (e.type == DioExceptionType.cancel) {
        errorMessage = "Request cancelled.";
      } else {
        errorMessage = "No internet or unknown error.";
      }

      debugPrint("Dio Error: $errorMessage");

      return {"status": false, "message": errorMessage};
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return {"status": false, "message": "Unexpected error occurred."};
    }
  }

  Future<Map<String, dynamic>> postApiOtp(
    String url,
    Map<String, dynamic>? request, {
    String? token,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: request,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      if (e is DioException) {
        print("Dio Error: ${e.message}");
        print("Response data: ${e.response?.data}");
        print("Status code: ${e.response?.statusCode}");
        return e.response?.data;
      } else {
        print("Unknown Error: $e");
      }
    }
    return {};
  }
}
