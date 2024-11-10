import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionRecord extends FirestoreRecord {
  QuestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "create_time" field.
  String? _createTime;
  String get createTime => _createTime ?? '';
  bool hasCreateTime() => _createTime != null;

  // "show" field.
  String? _show;
  String get show => _show ?? '';
  bool hasShow() => _show != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _status = snapshotData['status'] as String?;
    _createTime = snapshotData['create_time'] as String?;
    _show = snapshotData['show'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question');

  static Stream<QuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionRecord.fromSnapshot(s));

  static Future<QuestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionRecord.fromSnapshot(s));

  static QuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionRecordData({
  String? content,
  String? status,
  String? createTime,
  String? show,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'status': status,
      'create_time': createTime,
      'show': show,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionRecordDocumentEquality implements Equality<QuestionRecord> {
  const QuestionRecordDocumentEquality();

  @override
  bool equals(QuestionRecord? e1, QuestionRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.status == e2?.status &&
        e1?.createTime == e2?.createTime &&
        e1?.show == e2?.show;
  }

  @override
  int hash(QuestionRecord? e) => const ListEquality()
      .hash([e?.content, e?.status, e?.createTime, e?.show]);

  @override
  bool isValidKey(Object? o) => o is QuestionRecord;
}
