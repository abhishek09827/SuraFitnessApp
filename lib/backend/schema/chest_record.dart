import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChestRecord extends FirestoreRecord {
  ChestRecord._(
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

  // "workout" field.
  List<DocumentReference>? _workout;
  List<DocumentReference> get workout => _workout ?? const [];
  bool hasWorkout() => _workout != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _link = snapshotData['link'] as String?;
    _workout = getDataList(snapshotData['workout']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chest');

  static Stream<ChestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChestRecord.fromSnapshot(s));

  static Future<ChestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChestRecord.fromSnapshot(s));

  static ChestRecord fromSnapshot(DocumentSnapshot snapshot) => ChestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChestRecordData({
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
