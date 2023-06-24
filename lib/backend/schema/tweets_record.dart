import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TweetsRecord extends FirestoreRecord {
  TweetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "liked" field.
  int? _liked;
  int get liked => _liked ?? 0;
  bool hasLiked() => _liked != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "comments" field.
  List<DocumentReference>? _comments;
  List<DocumentReference> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "reported_by" field.
  List<DocumentReference>? _reportedBy;
  List<DocumentReference> get reportedBy => _reportedBy ?? const [];
  bool hasReportedBy() => _reportedBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _liked = castToType<int>(snapshotData['liked']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _video = snapshotData['video'] as String?;
    _likedBy = getDataList(snapshotData['liked_by']);
    _comments = getDataList(snapshotData['comments']);
    _reportedBy = getDataList(snapshotData['reported_by']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tweets')
          : FirebaseFirestore.instance.collectionGroup('tweets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tweets').doc();

  static Stream<TweetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TweetsRecord.fromSnapshot(s));

  static Future<TweetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TweetsRecord.fromSnapshot(s));

  static TweetsRecord fromSnapshot(DocumentSnapshot snapshot) => TweetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TweetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TweetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TweetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TweetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTweetsRecordData({
  String? name,
  DocumentReference? uid,
  String? image,
  int? liked,
  DateTime? createdTime,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'uid': uid,
      'image': image,
      'liked': liked,
      'created_time': createdTime,
      'video': video,
    }.withoutNulls,
  );

  return firestoreData;
}
