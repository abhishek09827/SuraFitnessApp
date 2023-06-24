import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BicepsRecord extends FirestoreRecord {
  BicepsRecord._(
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

  // "sets" field.
  int? _sets;
  int get sets => _sets ?? 0;
  bool hasSets() => _sets != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  bool hasReps() => _reps != null;

  // "kgs" field.
  int? _kgs;
  int get kgs => _kgs ?? 0;
  bool hasKgs() => _kgs != null;

  // "done" field.
  List<bool>? _done;
  List<bool> get done => _done ?? const [];
  bool hasDone() => _done != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _link = snapshotData['link'] as String?;
    _sets = castToType<int>(snapshotData['sets']);
    _reps = castToType<int>(snapshotData['reps']);
    _kgs = castToType<int>(snapshotData['kgs']);
    _done = getDataList(snapshotData['done']);
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('biceps');

  static Stream<BicepsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BicepsRecord.fromSnapshot(s));

  static Future<BicepsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BicepsRecord.fromSnapshot(s));

  static BicepsRecord fromSnapshot(DocumentSnapshot snapshot) => BicepsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BicepsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BicepsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BicepsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BicepsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBicepsRecordData({
  String? name,
  String? description,
  String? link,
  int? sets,
  int? reps,
  int? kgs,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'link': link,
      'sets': sets,
      'reps': reps,
      'kgs': kgs,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}
