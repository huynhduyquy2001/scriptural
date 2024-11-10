import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

String newCustomFunction(dynamic response) {
  print('response:$response');

  // Kiểm tra nếu response là Map (JSON đã được decode sẵn)
  if (response is Map) {
    try {
      // Lấy nội dung từ phần `choices[0].message.content`
      if (response['choices'] != null &&
          response['choices'][0]['message'] != null) {
        // Giải mã nội dung từ UTF-8 nếu cần
        final content = response['choices'][0]['message']['content'];

        // Sửa lỗi ký tự không đúng bằng cách chuyển đổi từ chuỗi bị lỗi
        final decodedContent = utf8.decode(content.runes.toList());
        return decodedContent; // Trả về chuỗi nội dung đã sửa
      } else {
        return 'Invalid response structure';
      }
    } catch (e) {
      return 'Error handling Map response: $e';
    }
  }

  // Nếu phản hồi là một chuỗi JSON, giải mã nó
  if (response is String) {
    try {
      // Giải mã chuỗi JSON thành Map
      final jsonResponse = json.decode(response);

      // Lấy nội dung từ phần `choices[0].message.content`
      if (jsonResponse['choices'] != null &&
          jsonResponse['choices'][0]['message'] != null) {
        // Giải mã nội dung từ UTF-8 nếu cần
        final content = jsonResponse['choices'][0]['message']['content'];

        // Sửa lỗi ký tự không đúng bằng cách chuyển đổi từ chuỗi bị lỗi
        final decodedContent = utf8.decode(content.runes.toList());
        return decodedContent; // Trả về chuỗi nội dung đã sửa
      } else {
        return 'Invalid response structure';
      }
    } catch (e) {
      return 'Error decoding JSON: $e';
    }
  }

  return 'Invalid response type'; // Trả về nếu không phải chuỗi hoặc Map
}
