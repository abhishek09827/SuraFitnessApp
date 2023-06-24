import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExercisesInRoutineRecord extends FirestoreRecord {
  ExercisesInRoutineRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "srw" field.
  List<DocumentReference>? _srw;
  List<DocumentReference> get srw => _srw ?? const [];
  bool hasSrw() => _srw != null;

  // "exId" field.
  DocumentReference? _exId;
  DocumentReference? get exId => _exId;
  bool hasExId() => _exId != null;

  // "setRep" field.
  List<DocumentReference>? _setRep;
  List<DocumentReference> get setRep => _setRep ?? const [];
  bool hasSetRep() => _setRep != null;

  // "workoutId" field.
  DocumentReference? _workoutId;
  DocumentReference? get workoutId => _workoutId;
  bool hasWorkoutId() => _workoutId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _srw = getDataList(snapshotData['srw']);
    _exId = snapshotData['exId'] as DocumentReference?;
    _setRep = getDataList(snapshotData['setRep']);
    _workoutId = snapshotData['workoutId'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('exercisesInRoutine')
          : FirebaseFirestore.instance.collectionGroup('exercisesInRoutine');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('exercisesInRoutine').doc();

  static Stream<ExercisesInRoutineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExercisesInRoutineRecord.fromSnapshot(s));

  static Future<ExercisesInRoutineRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ExercisesInRoutineRecord.fromSnapshot(s));

  static ExercisesInRoutineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExercisesInRoutineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExercisesInRoutineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExercisesInRoutineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExercisesInRoutineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExercisesInRoutineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExercisesInRoutineRecordData({
  DocumentReference? uid,
  DocumentReference? exId,
  DocumentReference? workoutId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'exId': exId,
      'workoutId': workoutId,
    }.withoutNulls,
  );

  return firestoreData;
}
