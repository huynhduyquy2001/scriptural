// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BooksByLetterStruct extends FFFirebaseStruct {
  BooksByLetterStruct({
    String? firstLetter,
    List<String>? bookIds,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstLetter = firstLetter,
        _bookIds = bookIds,
        super(firestoreUtilData);

  // "first_letter" field.
  String? _firstLetter;
  String get firstLetter => _firstLetter ?? '';
  set firstLetter(String? val) => _firstLetter = val;

  bool hasFirstLetter() => _firstLetter != null;

  // "book_ids" field.
  List<String>? _bookIds;
  List<String> get bookIds => _bookIds ?? const [];
  set bookIds(List<String>? val) => _bookIds = val;

  void updateBookIds(Function(List<String>) updateFn) {
    updateFn(_bookIds ??= []);
  }

  bool hasBookIds() => _bookIds != null;

  static BooksByLetterStruct fromMap(Map<String, dynamic> data) =>
      BooksByLetterStruct(
        firstLetter: data['first_letter'] as String?,
        bookIds: getDataList(data['book_ids']),
      );

  static BooksByLetterStruct? maybeFromMap(dynamic data) => data is Map
      ? BooksByLetterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'first_letter': _firstLetter,
        'book_ids': _bookIds,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_letter': serializeParam(
          _firstLetter,
          ParamType.String,
        ),
        'book_ids': serializeParam(
          _bookIds,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static BooksByLetterStruct fromSerializableMap(Map<String, dynamic> data) =>
      BooksByLetterStruct(
        firstLetter: deserializeParam(
          data['first_letter'],
          ParamType.String,
          false,
        ),
        bookIds: deserializeParam<String>(
          data['book_ids'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'BooksByLetterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BooksByLetterStruct &&
        firstLetter == other.firstLetter &&
        listEquality.equals(bookIds, other.bookIds);
  }

  @override
  int get hashCode => const ListEquality().hash([firstLetter, bookIds]);
}

BooksByLetterStruct createBooksByLetterStruct({
  String? firstLetter,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BooksByLetterStruct(
      firstLetter: firstLetter,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BooksByLetterStruct? updateBooksByLetterStruct(
  BooksByLetterStruct? booksByLetter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    booksByLetter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBooksByLetterStructData(
  Map<String, dynamic> firestoreData,
  BooksByLetterStruct? booksByLetter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (booksByLetter == null) {
    return;
  }
  if (booksByLetter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && booksByLetter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final booksByLetterData =
      getBooksByLetterFirestoreData(booksByLetter, forFieldValue);
  final nestedData =
      booksByLetterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = booksByLetter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBooksByLetterFirestoreData(
  BooksByLetterStruct? booksByLetter, [
  bool forFieldValue = false,
]) {
  if (booksByLetter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(booksByLetter.toMap());

  // Add any Firestore field values
  booksByLetter.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBooksByLetterListFirestoreData(
  List<BooksByLetterStruct>? booksByLetters,
) =>
    booksByLetters
        ?.map((e) => getBooksByLetterFirestoreData(e, true))
        .toList() ??
    [];
