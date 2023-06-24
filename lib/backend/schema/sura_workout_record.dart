import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuraWorkoutRecord extends FirestoreRecord {
  SuraWorkoutRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "routineName" field.
  String? _routineName;
  String get routineName => _routineName ?? '';
  bool hasRoutineName() => _routineName != null;

  // "exercisesDone" field.
  List<DocumentReference>? _exercisesDone;
  List<DocumentReference> get exercisesDone => _exercisesDone ?? const [];
  bool hasExercisesDone() => _exercisesDone != null;

  // "donOn" field.
  List<DateTime>? _donOn;
  List<DateTime> get donOn => _donOn ?? const [];
  bool hasDonOn() => _donOn != null;

  // "countUp" field.
  double? _countUp;
  double get countUp => _countUp ?? 0.0;
  bool hasCountUp() => _countUp != null;

  // "exercises" field.
  List<DocumentReference>? _exercises;
  List<DocumentReference> get exercises => _exercises ?? const [];
  bool hasExercises() => _exercises != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _routineName = snapshotData['routineName'] as String?;
    _exercisesDone = getDataList(snapshotData['exercisesDone']);
    _donOn = getDataList(snapshotData['donOn']);
    _countUp = castToType<double>(snapshotData['countUp']);
    _exercises = getDataList(snapshotData['exercises']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('suraWorkout');

  static Stream<SuraWorkoutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuraWorkoutRecord.fromSnapshot(s));

  static Future<SuraWorkoutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuraWorkoutRecord.fromSnapshot(s));

  static SuraWorkoutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuraWorkoutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuraWorkoutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuraWorkoutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuraWorkoutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuraWorkoutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuraWorkoutRecordData({
  DocumentReference? uid,
  DateTime? createdAt,
  String? routineName,
  double? countUp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'created_at': createdAt,
      'routineName': routineName,
      'countUp': countUp,
    }.withoutNulls,
  );

  return firestoreData;
}
