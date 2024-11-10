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

import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:characters/characters.dart'; // Import characters package

// Danh sách các phụ âm đầu tiên trong tiếng Hàn theo thứ tự Unicode
const List<String> initialConsonants = [
  'ㄱ',
  'ㄲ',
  'ㄴ',
  'ㄷ',
  'ㄸ',
  'ㄹ',
  'ㅁ',
  'ㅂ',
  'ㅃ',
  'ㅅ',
  'ㅆ',
  'ㅇ',
  'ㅈ',
  'ㅉ',
  'ㅊ',
  'ㅋ',
  'ㅌ',
  'ㅍ',
  'ㅎ'
];

String extractInitialConsonant(String hangul) {
  // Kiểm tra nếu ký tự là một ký tự Hangul
  if (hangul.codeUnitAt(0) >= 0xAC00 && hangul.codeUnitAt(0) <= 0xD7A3) {
    int codeUnit = hangul.codeUnitAt(0) - 0xAC00;
    int initialConsonantIndex = codeUnit ~/ 588;
    return initialConsonants[initialConsonantIndex];
  }
  // Trả về ký tự không phải Hangul nguyên gốc nếu không phải là ký tự Hangul
  return hangul;
}

Future<List<BooksRecord>> getBooksByFirstLetter(String key) async {
  // Khởi tạo một danh sách để lưu trữ kết quả
  List<BooksRecord> books = [];

  try {
    // Truy vấn tất cả các tài liệu từ collection Categories
    final categoriesSnapshot =
        await FirebaseFirestore.instance.collection('Categories').get();

    // Duyệt qua từng tài liệu (Category) trong snapshot
    for (var categoryDoc in categoriesSnapshot.docs) {
      // Truy vấn subcollection Books của từng Category
      final booksQuerySnapshot =
          await categoryDoc.reference.collection('Books').get();

      // Duyệt qua từng tài liệu (Book) trong subcollection Books
      for (var bookDoc in booksQuerySnapshot.docs) {
        // Kiểm tra xem trường 'title' có tồn tại và không null
        if (bookDoc.data().containsKey('title') && bookDoc['title'] != null) {
          // Lấy tên sách từ trường title
          String title = bookDoc['title'];

          // Kiểm tra nếu tên sách không rỗng
          if (title.isNotEmpty) {
            // Tách chuỗi thành các từ
            List<String> words = title.split(' ');

            if (words.isNotEmpty) {
              // Lấy từ đầu tiên và sau đó lấy ký tự đầu tiên
              String firstWord = words.first;
              String firstHangul = firstWord.characters.first;

              // Sử dụng hàm extractInitialConsonant để lấy phụ âm đầu tiên
              String initialConsonant = extractInitialConsonant(firstHangul);

              // So sánh phụ âm đầu tiên với key truyền vào
              if (initialConsonant == key) {
                // Chuyển đổi dữ liệu sách thành BooksRecord và thêm vào danh sách
                books.add(BooksRecord.fromSnapshot(bookDoc));
              }
            }
          }
        }
      }
    }

    return books;
  } catch (e) {
    print('Lỗi khi lấy dữ liệu: $e');
    return [];
  }
}
