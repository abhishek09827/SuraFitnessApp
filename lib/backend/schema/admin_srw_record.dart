import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminSrwRecord extends FirestoreRecord {
  AdminSrwRecord._(
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

  // "kg" field.
  int? _kg;
  int get kg => _kg ?? 0;
  bool hasKg() => _kg != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  // "eirId" field.
  DocumentReference? _eirId;
  DocumentReference? get eirId => _eirId;
  bool hasEirId() => _eirId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _set = castToType<int>(snapshotData['set']);
    _reps = castToType<int>(snapshotData['reps']);
    _kg = castToType<int>(snapshotData['kg']);
    _done = snapshotData['done'] as bool?;
    _eirId = snapshotData['eirId'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('adminSrw')
          : FirebaseFirestore.instance.collectionGroup('adminSrw');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('adminSrw').doc();

  static Stream<AdminSrwRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminSrwRecord.fromSnapshot(s));

  static Future<AdminSrwRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminSrwRecord.fromSnapshot(s));

  static AdminSrwRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminSrwRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminSrwRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminSrwRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminSrwRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminSrwRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminSrwRecordData({
  DocumentReference? uid,
  int? set,
  int? reps,
  int? kg,
  bool? done,
  DocumentReference? eirId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'set': set,
      'reps': reps,
      'kg': kg,
      'done': done,
      'eirId': eirId,
    }.withoutNulls,
  );

  return firestoreData;
}
