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

Future<ChaptersRecord> getNextChapter(ChaptersRecord currentChapter) async {
  // Lấy danh sách tất cả các chapter có cùng book_id với currentChapter và sắp xếp tăng dần theo chapter_number
  final querySnapshot = await FirebaseFirestore.instance
      .collection('Chapters')
      .where('book_id', isEqualTo: currentChapter.bookId)
      .orderBy('chapter_number', descending: false)
      .get();

  // Chuyển đổi dữ liệu truy vấn thành danh sách ChaptersRecord
  final chaptersList = querySnapshot.docs
      .map((doc) => ChaptersRecord.fromSnapshot(doc))
      .toList();

  // Tìm vị trí của currentChapter trong danh sách chaptersList
  int currentIndex = chaptersList
      .indexWhere((chapter) => chapter.reference == currentChapter.reference);

  // Nếu currentChapter không phải là chương cuối cùng, trả về chương tiếp theo
  if (currentIndex >= 0 && currentIndex < chaptersList.length - 1) {
    return chaptersList[currentIndex + 1];
  } else {
    // Nếu currentChapter là chương cuối cùng, trả về chương đầu tiên
    return chaptersList.first;
  }
}
