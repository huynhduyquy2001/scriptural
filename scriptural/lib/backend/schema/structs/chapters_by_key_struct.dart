// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChaptersByKeyStruct extends FFFirebaseStruct {
  ChaptersByKeyStruct({
    String? bookTitle,
    DocumentReference? chapter,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bookTitle = bookTitle,
        _chapter = chapter,
        super(firestoreUtilData);

  // "book_title" field.
  String? _bookTitle;
  String get bookTitle => _bookTitle ?? '';
  set bookTitle(String? val) => _bookTitle = val;

  bool hasBookTitle() => _bookTitle != null;

  // "chapter" field.
  DocumentReference? _chapter;
  DocumentReference? get chapter => _chapter;
  set chapter(DocumentReference? val) => _chapter = val;

  bool hasChapter() => _chapter != null;

  static ChaptersByKeyStruct fromMap(Map<String, dynamic> data) =>
      ChaptersByKeyStruct(
        bookTitle: data['book_title'] as String?,
        chapter: data['chapter'] as DocumentReference?,
      );

  static ChaptersByKeyStruct? maybeFromMap(dynamic data) => data is Map
      ? ChaptersByKeyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'book_title': _bookTitle,
        'chapter': _chapter,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'book_title': serializeParam(
          _bookTitle,
          ParamType.String,
        ),
        'chapter': serializeParam(
          _chapter,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ChaptersByKeyStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChaptersByKeyStruct(
        bookTitle: deserializeParam(
          data['book_title'],
          ParamType.String,
          false,
        ),
        chapter: deserializeParam(
          data['chapter'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Chapters'],
        ),
      );

  @override
  String toString() => 'ChaptersByKeyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChaptersByKeyStruct &&
        bookTitle == other.bookTitle &&
        chapter == other.chapter;
  }

  @override
  int get hashCode => const ListEquality().hash([bookTitle, chapter]);
}

ChaptersByKeyStruct createChaptersByKeyStruct({
  String? bookTitle,
  DocumentReference? chapter,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChaptersByKeyStruct(
      bookTitle: bookTitle,
      chapter: chapter,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChaptersByKeyStruct? updateChaptersByKeyStruct(
  ChaptersByKeyStruct? chaptersByKey, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chaptersByKey
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChaptersByKeyStructData(
  Map<String, dynamic> firestoreData,
  ChaptersByKeyStruct? chaptersByKey,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chaptersByKey == null) {
    return;
  }
  if (chaptersByKey.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chaptersByKey.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chaptersByKeyData =
      getChaptersByKeyFirestoreData(chaptersByKey, forFieldValue);
  final nestedData =
      chaptersByKeyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chaptersByKey.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChaptersByKeyFirestoreData(
  ChaptersByKeyStruct? chaptersByKey, [
  bool forFieldValue = false,
]) {
  if (chaptersByKey == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chaptersByKey.toMap());

  // Add any Firestore field values
  chaptersByKey.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChaptersByKeyListFirestoreData(
  List<ChaptersByKeyStruct>? chaptersByKeys,
) =>
    chaptersByKeys
        ?.map((e) => getChaptersByKeyFirestoreData(e, true))
        .toList() ??
    [];
