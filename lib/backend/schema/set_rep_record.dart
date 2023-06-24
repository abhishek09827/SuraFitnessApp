import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SetRepRecord extends FirestoreRecord {
  SetRepRecord._(
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

  // "workoutId" field.
  DocumentReference? _workoutId;
  DocumentReference? get workoutId => _workoutId;
  bool hasWorkoutId() => _workoutId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _set = castToType<int>(snapshotData['set']);
    _reps = castToType<int>(snapshotData['reps']);
    _kg = castToType<int>(snapshotData['kg']);
    _done = snapshotData['done'] as bool?;
    _eirId = snapshotData['eirId'] as DocumentReference?;
    _workoutId = snapshotData['workoutId'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('setRep')
          : FirebaseFirestore.instance.collectionGroup('setRep');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('setRep').doc();

  static Stream<SetRepRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SetRepRecord.fromSnapshot(s));

  static Future<SetRepRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SetRepRecord.fromSnapshot(s));

  static SetRepRecord fromSnapshot(DocumentSnapshot snapshot) => SetRepRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SetRepRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SetRepRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SetRepRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SetRepRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSetRepRecordData({
  DocumentReference? uid,
  int? set,
  int? reps,
  int? kg,
  bool? done,
  DocumentReference? eirId,
  DocumentReference? workoutId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'set': set,
      'reps': reps,
      'kg': kg,
      'done': done,
      'eirId': eirId,
      'workoutId': workoutId,
    }.withoutNulls,
  );

  return firestoreData;
}
