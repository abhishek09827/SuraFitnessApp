import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TricepsRecord extends FirestoreRecord {
  TricepsRecord._(
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
      FirebaseFirestore.instance.collection('triceps');

  static Stream<TricepsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TricepsRecord.fromSnapshot(s));

  static Future<TricepsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TricepsRecord.fromSnapshot(s));

  static TricepsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TricepsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TricepsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TricepsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TricepsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TricepsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTricepsRecordData({
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
