import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChaptersRecord extends FirestoreRecord {
  ChaptersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pdf_url" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "chapter_number" field.
  int? _chapterNumber;
  int get chapterNumber => _chapterNumber ?? 0;
  bool hasChapterNumber() => _chapterNumber != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "comment_link" field.
  String? _commentLink;
  String get commentLink => _commentLink ?? '';
  bool hasCommentLink() => _commentLink != null;

  // "book_id" field.
  String? _bookId;
  String get bookId => _bookId ?? '';
  bool hasBookId() => _bookId != null;

  void _initializeFields() {
    _pdfUrl = snapshotData['pdf_url'] as String?;
    _chapterNumber = castToType<int>(snapshotData['chapter_number']);
    _image = snapshotData['image'] as String?;
    _title = snapshotData['title'] as String?;
    _commentLink = snapshotData['comment_link'] as String?;
    _bookId = snapshotData['book_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chapters');

  static Stream<ChaptersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChaptersRecord.fromSnapshot(s));

  static Future<ChaptersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChaptersRecord.fromSnapshot(s));

  static ChaptersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChaptersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChaptersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChaptersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChaptersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChaptersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChaptersRecordData({
  String? pdfUrl,
  int? chapterNumber,
  String? image,
  String? title,
  String? commentLink,
  String? bookId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pdf_url': pdfUrl,
      'chapter_number': chapterNumber,
      'image': image,
      'title': title,
      'comment_link': commentLink,
      'book_id': bookId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChaptersRecordDocumentEquality implements Equality<ChaptersRecord> {
  const ChaptersRecordDocumentEquality();

  @override
  bool equals(ChaptersRecord? e1, ChaptersRecord? e2) {
    return e1?.pdfUrl == e2?.pdfUrl &&
        e1?.chapterNumber == e2?.chapterNumber &&
        e1?.image == e2?.image &&
        e1?.title == e2?.title &&
        e1?.commentLink == e2?.commentLink &&
        e1?.bookId == e2?.bookId;
  }

  @override
  int hash(ChaptersRecord? e) => const ListEquality().hash([
        e?.pdfUrl,
        e?.chapterNumber,
        e?.image,
        e?.title,
        e?.commentLink,
        e?.bookId
      ]);

  @override
  bool isValidKey(Object? o) => o is ChaptersRecord;
}
