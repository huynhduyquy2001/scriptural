import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyBookRecord extends FirestoreRecord {
  DailyBookRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "book_id" field.
  String? _bookId;
  String get bookId => _bookId ?? '';
  bool hasBookId() => _bookId != null;

  void _initializeFields() {
    _bookId = snapshotData['book_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DailyBook');

  static Stream<DailyBookRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailyBookRecord.fromSnapshot(s));

  static Future<DailyBookRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailyBookRecord.fromSnapshot(s));

  static DailyBookRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailyBookRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailyBookRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailyBookRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailyBookRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailyBookRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailyBookRecordData({
  String? bookId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'book_id': bookId,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailyBookRecordDocumentEquality implements Equality<DailyBookRecord> {
  const DailyBookRecordDocumentEquality();

  @override
  bool equals(DailyBookRecord? e1, DailyBookRecord? e2) {
    return e1?.bookId == e2?.bookId;
  }

  @override
  int hash(DailyBookRecord? e) => const ListEquality().hash([e?.bookId]);

  @override
  bool isValidKey(Object? o) => o is DailyBookRecord;
}
