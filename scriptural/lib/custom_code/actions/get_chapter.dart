// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ChaptersRecord> getChapter(String bookId) async {
  // Kiểm tra nếu bookId là null hoặc rỗng
  if (bookId == null || bookId.isEmpty) {
    throw ArgumentError('Book ID must not be null or empty');
  }

  try {
    // Tạo truy vấn để tìm chapter với bookId phù hợp
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Chapters')
        .where('book_id', isEqualTo: bookId)
        .limit(1) // Lấy một kết quả đầu tiên tìm thấy
        .get();

    // Kiểm tra nếu tìm thấy ít nhất một tài liệu
    if (querySnapshot.docs.isNotEmpty) {
      // Trả về đối tượng ChaptersRecord từ tài liệu đầu tiên tìm thấy
      return ChaptersRecord.fromSnapshot(querySnapshot.docs.first);
    } else {
      // Nếu không tìm thấy, ném ra ngoại lệ
      throw Exception('No chapter found for the given book ID');
    }
  } catch (e) {
    print('Error fetching chapter: $e');
    throw Exception('Error fetching chapter: $e');
  }
}
