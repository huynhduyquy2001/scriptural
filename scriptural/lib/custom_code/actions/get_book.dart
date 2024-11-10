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

Future<BooksRecord> getBook(String? currentBookId) async {
  // Add your function code here!

  try {
    // Lấy tất cả các tài liệu từ collection 'Categories'
    final categoriesSnapshot =
        await FirebaseFirestore.instance.collection('Categories').get();

    // Duyệt qua tất cả các tài liệu trong 'Categories'
    for (var categoryDoc in categoriesSnapshot.docs) {
      // Tạo tham chiếu đến subcollection 'Books' trong mỗi tài liệu 'Categories'
      final booksCollectionRef = categoryDoc.reference.collection('Books');

      // Kiểm tra xem sách có tồn tại với currentBookId trong subcollection 'Books' không
      final bookDocSnapshot = await booksCollectionRef.doc(currentBookId).get();

      if (bookDocSnapshot.exists) {
        // Nếu tài liệu tồn tại, trả về một đối tượng BooksRecord từ tài liệu này
        return BooksRecord.fromSnapshot(bookDocSnapshot);
      }
    }

    // Nếu không tìm thấy cuốn sách nào, bạn có thể trả về một đối tượng BooksRecord mặc định hoặc báo lỗi
    throw Exception('Book not found');
  } catch (e) {
    print('Error fetching book: $e');
    throw Exception('Error fetching book: $e');
  }
}
