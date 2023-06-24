import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BackRecord extends FirestoreRecord {
  BackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('back');

  static Stream<BackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BackRecord.fromSnapshot(s));

  static Future<BackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BackRecord.fromSnapshot(s));

  static BackRecord fromSnapshot(DocumentSnapshot snapshot) => BackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBackRecordData({
  String? name,
  String? description,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}
