import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OthersRecord extends FirestoreRecord {
  OthersRecord._(
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
      FirebaseFirestore.instance.collection('others');

  static Stream<OthersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OthersRecord.fromSnapshot(s));

  static Future<OthersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OthersRecord.fromSnapshot(s));

  static OthersRecord fromSnapshot(DocumentSnapshot snapshot) => OthersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OthersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OthersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OthersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OthersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOthersRecordData({
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
