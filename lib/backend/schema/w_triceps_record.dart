import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WTricepsRecord extends FirestoreRecord {
  WTricepsRecord._(
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

  // "triceps" field.
  DocumentReference? _triceps;
  DocumentReference? get triceps => _triceps;
  bool hasTriceps() => _triceps != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _set = castToType<int>(snapshotData['set']);
    _reps = castToType<int>(snapshotData['reps']);
    _done = snapshotData['done'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _kg = castToType<int>(snapshotData['kg']);
    _triceps = snapshotData['triceps'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wTriceps');

  static Stream<WTricepsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WTricepsRecord.fromSnapshot(s));

  static Future<WTricepsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WTricepsRecord.fromSnapshot(s));

  static WTricepsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WTricepsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WTricepsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WTricepsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WTricepsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WTricepsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWTricepsRecordData({
  DocumentReference? uid,
  int? set,
  int? reps,
  bool? done,
  DateTime? createdAt,
  int? kg,
  DocumentReference? triceps,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'set': set,
      'reps': reps,
      'done': done,
      'created_at': createdAt,
      'kg': kg,
      'triceps': triceps,
    }.withoutNulls,
  );

  return firestoreData;
}
