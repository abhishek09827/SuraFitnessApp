import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WBicepsRecord extends FirestoreRecord {
  WBicepsRecord._(
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

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "kg" field.
  int? _kg;
  int get kg => _kg ?? 0;
  bool hasKg() => _kg != null;

  // "biceps" field.
  DocumentReference? _biceps;
  DocumentReference? get biceps => _biceps;
  bool hasBiceps() => _biceps != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _set = castToType<int>(snapshotData['set']);
    _reps = castToType<int>(snapshotData['reps']);
    _done = snapshotData['done'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _kg = castToType<int>(snapshotData['kg']);
    _biceps = snapshotData['biceps'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wBiceps');

  static Stream<WBicepsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WBicepsRecord.fromSnapshot(s));

  static Future<WBicepsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WBicepsRecord.fromSnapshot(s));

  static WBicepsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WBicepsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WBicepsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WBicepsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WBicepsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WBicepsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWBicepsRecordData({
  DocumentReference? uid,
  int? set,
  int? reps,
  bool? done,
  DateTime? createdAt,
  int? kg,
  DocumentReference? biceps,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'set': set,
      'reps': reps,
      'done': done,
      'created_at': createdAt,
      'kg': kg,
      'biceps': biceps,
    }.withoutNulls,
  );

  return firestoreData;
}
