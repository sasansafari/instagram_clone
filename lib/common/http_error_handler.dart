import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      debugPrint(jsonDecode(response.data)['msg']);
      break;
    case 400:
      debugPrint(jsonDecode(response.data)['msg']);

      break;
    case 500:
      debugPrint(jsonDecode(response.data)['msg']);

      break;
    case 404:
      debugPrint(jsonDecode(response.data)['msg']);

      break;
    default:
      debugPrint(jsonDecode(response.data)['msg']);
  }
}
