import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'scriptural_page_widget.dart' show ScripturalPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ScripturalPageModel extends FlutterFlowModel<ScripturalPageWidget> {
  ///  Local state fields for this page.

  BooksRecord? selectedBook;

  ChaptersRecord? selectedChapter;

  ChaptersRecord? prevChapter;

  ChaptersRecord? nextChapter;

  BooksRecord? tempBook;

  List<BooksByLetterStruct> firstLettersState = [];
  void addToFirstLettersState(BooksByLetterStruct item) =>
      firstLettersState.add(item);
  void removeFromFirstLettersState(BooksByLetterStruct item) =>
      firstLettersState.remove(item);
  void removeAtIndexFromFirstLettersState(int index) =>
      firstLettersState.removeAt(index);
  void insertAtIndexInFirstLettersState(int index, BooksByLetterStruct item) =>
      firstLettersState.insert(index, item);
  void updateFirstLettersStateAtIndex(
          int index, Function(BooksByLetterStruct) updateFn) =>
      firstLettersState[index] = updateFn(firstLettersState[index]);

  int orderBy = 1;

  String? key;

  List<BooksRecord> booksSearchByKey = [];
  void addToBooksSearchByKey(BooksRecord item) => booksSearchByKey.add(item);
  void removeFromBooksSearchByKey(BooksRecord item) =>
      booksSearchByKey.remove(item);
  void removeAtIndexFromBooksSearchByKey(int index) =>
      booksSearchByKey.removeAt(index);
  void insertAtIndexInBooksSearchByKey(int index, BooksRecord item) =>
      booksSearchByKey.insert(index, item);
  void updateBooksSearchByKeyAtIndex(
          int index, Function(BooksRecord) updateFn) =>
      booksSearchByKey[index] = updateFn(booksSearchByKey[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBook] action in ScripturalPage widget.
  BooksRecord? customBookTrue;
  // Stores action output result for [Firestore Query - Query a collection] action in ScripturalPage widget.
  DailyBookRecord? dailyBook;
  // Stores action output result for [Custom Action - getBook] action in ScripturalPage widget.
  BooksRecord? customBookFalse;
  // Stores action output result for [Firestore Query - Query a collection] action in ScripturalPage widget.
  ChaptersRecord? currentChapter;
  // Stores action output result for [Custom Action - getPrevChapter] action in ScripturalPage widget.
  ChaptersRecord? pChapter;
  // Stores action output result for [Custom Action - getNextChapter] action in ScripturalPage widget.
  ChaptersRecord? nChapter;
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // Model for navigation component.
  late NavigationModel navigationModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - getChaptersByBookKey] action in TextField widget.
  List<ChaptersByKeyStruct>? chaptersByKey;
  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // Stores action output result for [Custom Action - getFirstLetters] action in Button widget.
  List<BooksByLetterStruct>? firstLetters;

  @override
  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    tabBarController1?.dispose();
    navigationModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController2?.dispose();
  }
}
