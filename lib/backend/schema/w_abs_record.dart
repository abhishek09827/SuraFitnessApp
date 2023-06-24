import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WAbsRecord extends FirestoreRecord {
  WAbsRecord._(
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

  // "abs" field.
  DocumentReference? _abs;
  DocumentReference? get abs => _abs;
  bool hasAbs() => _abs != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _set = castToType<int>(snapshotData['set']);
    _reps = castToType<int>(snapshotData['reps']);
    _done = snapshotData['done'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _kg = castToType<int>(snapshotData['kg']);
    _abs = snapshotData['abs'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wAbs');

  static Stream<WAbsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WAbsRecord.fromSnapshot(s));

  static Future<WAbsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WAbsRecord.fromSnapshot(s));

  static WAbsRecord fromSnapshot(DocumentSnapshot snapshot) => WAbsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WAbsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WAbsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WAbsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WAbsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWAbsRecordData({
  DocumentReference? uid,
  int? set,
  int? reps,
  bool? done,
  DateTime? createdAt,
  int? kg,
  DocumentReference? abs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'set': set,
      'reps': reps,
      'done': done,
      'created_at': createdAt,
      'kg': kg,
      'abs': abs,
    }.withoutNulls,
  );

  return firestoreData;
}
