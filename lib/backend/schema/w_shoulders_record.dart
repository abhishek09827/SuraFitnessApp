import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WShouldersRecord extends FirestoreRecord {
  WShouldersRecord._(
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

  // "shoulders" field.
  DocumentReference? _shoulders;
  DocumentReference? get shoulders => _shoulders;
  bool hasShoulders() => _shoulders != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _set = castToType<int>(snapshotData['set']);
    _reps = castToType<int>(snapshotData['reps']);
    _done = snapshotData['done'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _kg = castToType<int>(snapshotData['kg']);
    _shoulders = snapshotData['shoulders'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wShoulders');

  static Stream<WShouldersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WShouldersRecord.fromSnapshot(s));

  static Future<WShouldersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WShouldersRecord.fromSnapshot(s));

  static WShouldersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WShouldersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WShouldersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WShouldersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WShouldersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WShouldersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWShouldersRecordData({
  DocumentReference? uid,
  int? set,
  int? reps,
  bool? done,
  DateTime? createdAt,
  int? kg,
  DocumentReference? shoulders,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'set': set,
      'reps': reps,
      'done': done,
      'created_at': createdAt,
      'kg': kg,
      'shoulders': shoulders,
    }.withoutNulls,
  );

  return firestoreData;
}
