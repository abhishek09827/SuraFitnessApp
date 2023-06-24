import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WChestRecord extends FirestoreRecord {
  WChestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "set" field.
  int? _set;
  int get set => _set ?? 0;
  bool hasSet() => _set != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  bool hasReps() => _reps != null;

  // "kgs" field.
  int? _kgs;
  int get kgs => _kgs ?? 0;
  bool hasKgs() => _kgs != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "chest" field.
  DocumentReference? _chest;
  DocumentReference? get chest => _chest;
  bool hasChest() => _chest != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _set = castToType<int>(snapshotData['set']);
    _reps = castToType<int>(snapshotData['reps']);
    _kgs = castToType<int>(snapshotData['kgs']);
    _done = snapshotData['done'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _chest = snapshotData['chest'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wChest');

  static Stream<WChestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WChestRecord.fromSnapshot(s));

  static Future<WChestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WChestRecord.fromSnapshot(s));

  static WChestRecord fromSnapshot(DocumentSnapshot snapshot) => WChestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WChestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WChestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WChestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WChestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWChestRecordData({
  DocumentReference? uid,
  int? set,
  int? reps,
  int? kgs,
  bool? done,
  DateTime? createdAt,
  DocumentReference? chest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'set': set,
      'reps': reps,
      'kgs': kgs,
      'done': done,
      'created_at': createdAt,
      'chest': chest,
    }.withoutNulls,
  );

  return firestoreData;
}
