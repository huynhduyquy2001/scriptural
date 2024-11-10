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

Future<List<ChaptersByKeyStruct>?> getChaptersByBookKey(String? key) async {
  if (key == null || key.isEmpty) {
    return null;
  }

  key = key.replaceAll(' ', '');
  List<ChaptersByKeyStruct> matchingChaptersByKey = [];

  try {
    final categoriesSnapshot =
        await FirebaseFirestore.instance.collection('Categories').get();

    // Prepare a list of future tasks to fetch books
    List<Future<QuerySnapshot>> bookFetchTasks = [];

    // Mapping from books to their corresponding snapshot results
    List<BooksRecord> allBooks = [];

    for (var categoryDoc in categoriesSnapshot.docs) {
      bookFetchTasks.add(categoryDoc.reference.collection('Books').get());
    }

    // Execute all fetch tasks in parallel to get books
    final booksSnapshots = await Future.wait(bookFetchTasks);

    for (var booksSnapshot in booksSnapshots) {
      for (var bookDoc in booksSnapshot.docs) {
        var book = BooksRecord.fromSnapshot(bookDoc);
        allBooks.add(book);
      }
    }

    // Prepare a list of future tasks to fetch chapters for all books
    List<Future<QuerySnapshot>> chapterFetchTasks = [];

    for (var book in allBooks) {
      // Fetch chapters for each book in parallel
      chapterFetchTasks.add(
        FirebaseFirestore.instance
            .collection('Chapters')
            .where('book_id', isEqualTo: book.reference.id)
            .get(),
      );
    }

    // Execute all chapter fetch tasks in parallel
    final chaptersSnapshots = await Future.wait(chapterFetchTasks);

    int bookIndex = 0;
    for (var chaptersSnapshot in chaptersSnapshots) {
      var book = allBooks[
          bookIndex]; // Retrieve the corresponding book for the chapters
      bookIndex++;

      for (var chapterDoc in chaptersSnapshot.docs) {
        // Cast data to a Map<String, dynamic>
        var chapterData = chapterDoc.data() as Map<String, dynamic>;
        var chapterNumber =
            (chapterData['chapter_number'] as int?)?.toString() ?? '';
        String combinedString = (book.title ?? '') + chapterNumber + "장";

        if (combinedString.toLowerCase().contains(key.toLowerCase())) {
          var chapterStruct = ChaptersByKeyStruct(
            bookTitle: book.title!,
            chapter: chapterDoc.reference,
          );

          matchingChaptersByKey.add(chapterStruct);
        }
      }
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }

  return matchingChaptersByKey;
}
