import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _chest = (await secureStorage.getStringList('ff_chest'))
              ?.map((path) => path.ref)
              .toList() ??
          _chest;
    });
    await _safeInitAsync(() async {
      _triceps = (await secureStorage.getStringList('ff_triceps'))
              ?.map((path) => path.ref)
              .toList() ??
          _triceps;
    });
    await _safeInitAsync(() async {
      _biceps = (await secureStorage.getStringList('ff_biceps'))
              ?.map((path) => path.ref)
              .toList() ??
          _biceps;
    });
    await _safeInitAsync(() async {
      _shoulders = (await secureStorage.getStringList('ff_shoulders'))
              ?.map((path) => path.ref)
              .toList() ??
          _shoulders;
    });
    await _safeInitAsync(() async {
      _back = (await secureStorage.getStringList('ff_back'))
              ?.map((path) => path.ref)
              .toList() ??
          _back;
    });
    await _safeInitAsync(() async {
      _legs = (await secureStorage.getStringList('ff_legs'))
              ?.map((path) => path.ref)
              .toList() ??
          _legs;
    });
    await _safeInitAsync(() async {
      _abs = (await secureStorage.getStringList('ff_abs'))
              ?.map((path) => path.ref)
              .toList() ??
          _abs;
    });
    await _safeInitAsync(() async {
      _sets = (await secureStorage.getStringList('ff_sets'))
              ?.map(int.parse)
              .toList() ??
          _sets;
    });
    await _safeInitAsync(() async {
      _reps = (await secureStorage.getStringList('ff_reps'))
              ?.map(int.parse)
              .toList() ??
          _reps;
    });
    await _safeInitAsync(() async {
      _kgs = (await secureStorage.getStringList('ff_kgs'))
              ?.map(int.parse)
              .toList() ??
          _kgs;
    });
    await _safeInitAsync(() async {
      _done = (await secureStorage.getStringList('ff_done'))
              ?.map((x) => x == 'true')
              .toList() ??
          _done;
    });
    await _safeInitAsync(() async {
      _liked = (await secureStorage.getStringList('ff_liked'))
              ?.map((x) => x == 'true')
              .toList() ??
          _liked;
    });
    await _safeInitAsync(() async {
      _others = (await secureStorage.getStringList('ff_others'))
              ?.map((path) => path.ref)
              .toList() ??
          _others;
    });
    await _safeInitAsync(() async {
      _iconClick = await secureStorage.getBool('ff_iconClick') ?? _iconClick;
    });
    await _safeInitAsync(() async {
      _likeclick = await secureStorage.getBool('ff_likeclick') ?? _likeclick;
    });
    await _safeInitAsync(() async {
      _showComment =
          await secureStorage.getBool('ff_showComment') ?? _showComment;
    });
    await _safeInitAsync(() async {
      _allExercise = (await secureStorage.getStringList('ff_allExercise'))
              ?.map((path) => path.ref)
              .toList() ??
          _allExercise;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _completed = false;
  bool get completed => _completed;
  set completed(bool _value) {
    _completed = _value;
  }

  bool _showFullList = true;
  bool get showFullList => _showFullList;
  set showFullList(bool _value) {
    _showFullList = _value;
  }

  List<bool> _buttonClick = [];
  List<bool> get buttonClick => _buttonClick;
  set buttonClick(List<bool> _value) {
    _buttonClick = _value;
  }

  void addToButtonClick(bool _value) {
    _buttonClick.add(_value);
  }

  void removeFromButtonClick(bool _value) {
    _buttonClick.remove(_value);
  }

  void removeAtIndexFromButtonClick(int _index) {
    _buttonClick.removeAt(_index);
  }

  void updateButtonClickAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _buttonClick[_index] = updateFn(_buttonClick[_index]);
  }

  List<DocumentReference> _chest = [];
  List<DocumentReference> get chest => _chest;
  set chest(List<DocumentReference> _value) {
    _chest = _value;
    secureStorage.setStringList('ff_chest', _value.map((x) => x.path).toList());
  }

  void deleteChest() {
    secureStorage.delete(key: 'ff_chest');
  }

  void addToChest(DocumentReference _value) {
    _chest.add(_value);
    secureStorage.setStringList('ff_chest', _chest.map((x) => x.path).toList());
  }

  void removeFromChest(DocumentReference _value) {
    _chest.remove(_value);
    secureStorage.setStringList('ff_chest', _chest.map((x) => x.path).toList());
  }

  void removeAtIndexFromChest(int _index) {
    _chest.removeAt(_index);
    secureStorage.setStringList('ff_chest', _chest.map((x) => x.path).toList());
  }

  void updateChestAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _chest[_index] = updateFn(_chest[_index]);
    secureStorage.setStringList('ff_chest', _chest.map((x) => x.path).toList());
  }

  List<DocumentReference> _triceps = [];
  List<DocumentReference> get triceps => _triceps;
  set triceps(List<DocumentReference> _value) {
    _triceps = _value;
    secureStorage.setStringList(
        'ff_triceps', _value.map((x) => x.path).toList());
  }

  void deleteTriceps() {
    secureStorage.delete(key: 'ff_triceps');
  }

  void addToTriceps(DocumentReference _value) {
    _triceps.add(_value);
    secureStorage.setStringList(
        'ff_triceps', _triceps.map((x) => x.path).toList());
  }

  void removeFromTriceps(DocumentReference _value) {
    _triceps.remove(_value);
    secureStorage.setStringList(
        'ff_triceps', _triceps.map((x) => x.path).toList());
  }

  void removeAtIndexFromTriceps(int _index) {
    _triceps.removeAt(_index);
    secureStorage.setStringList(
        'ff_triceps', _triceps.map((x) => x.path).toList());
  }

  void updateTricepsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _triceps[_index] = updateFn(_triceps[_index]);
    secureStorage.setStringList(
        'ff_triceps', _triceps.map((x) => x.path).toList());
  }

  List<DocumentReference> _biceps = [];
  List<DocumentReference> get biceps => _biceps;
  set biceps(List<DocumentReference> _value) {
    _biceps = _value;
    secureStorage.setStringList(
        'ff_biceps', _value.map((x) => x.path).toList());
  }

  void deleteBiceps() {
    secureStorage.delete(key: 'ff_biceps');
  }

  void addToBiceps(DocumentReference _value) {
    _biceps.add(_value);
    secureStorage.setStringList(
        'ff_biceps', _biceps.map((x) => x.path).toList());
  }

  void removeFromBiceps(DocumentReference _value) {
    _biceps.remove(_value);
    secureStorage.setStringList(
        'ff_biceps', _biceps.map((x) => x.path).toList());
  }

  void removeAtIndexFromBiceps(int _index) {
    _biceps.removeAt(_index);
    secureStorage.setStringList(
        'ff_biceps', _biceps.map((x) => x.path).toList());
  }

  void updateBicepsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _biceps[_index] = updateFn(_biceps[_index]);
    secureStorage.setStringList(
        'ff_biceps', _biceps.map((x) => x.path).toList());
  }

  List<DocumentReference> _shoulders = [];
  List<DocumentReference> get shoulders => _shoulders;
  set shoulders(List<DocumentReference> _value) {
    _shoulders = _value;
    secureStorage.setStringList(
        'ff_shoulders', _value.map((x) => x.path).toList());
  }

  void deleteShoulders() {
    secureStorage.delete(key: 'ff_shoulders');
  }

  void addToShoulders(DocumentReference _value) {
    _shoulders.add(_value);
    secureStorage.setStringList(
        'ff_shoulders', _shoulders.map((x) => x.path).toList());
  }

  void removeFromShoulders(DocumentReference _value) {
    _shoulders.remove(_value);
    secureStorage.setStringList(
        'ff_shoulders', _shoulders.map((x) => x.path).toList());
  }

  void removeAtIndexFromShoulders(int _index) {
    _shoulders.removeAt(_index);
    secureStorage.setStringList(
        'ff_shoulders', _shoulders.map((x) => x.path).toList());
  }

  void updateShouldersAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _shoulders[_index] = updateFn(_shoulders[_index]);
    secureStorage.setStringList(
        'ff_shoulders', _shoulders.map((x) => x.path).toList());
  }

  List<DocumentReference> _back = [];
  List<DocumentReference> get back => _back;
  set back(List<DocumentReference> _value) {
    _back = _value;
    secureStorage.setStringList('ff_back', _value.map((x) => x.path).toList());
  }

  void deleteBack() {
    secureStorage.delete(key: 'ff_back');
  }

  void addToBack(DocumentReference _value) {
    _back.add(_value);
    secureStorage.setStringList('ff_back', _back.map((x) => x.path).toList());
  }

  void removeFromBack(DocumentReference _value) {
    _back.remove(_value);
    secureStorage.setStringList('ff_back', _back.map((x) => x.path).toList());
  }

  void removeAtIndexFromBack(int _index) {
    _back.removeAt(_index);
    secureStorage.setStringList('ff_back', _back.map((x) => x.path).toList());
  }

  void updateBackAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _back[_index] = updateFn(_back[_index]);
    secureStorage.setStringList('ff_back', _back.map((x) => x.path).toList());
  }

  List<DocumentReference> _legs = [];
  List<DocumentReference> get legs => _legs;
  set legs(List<DocumentReference> _value) {
    _legs = _value;
    secureStorage.setStringList('ff_legs', _value.map((x) => x.path).toList());
  }

  void deleteLegs() {
    secureStorage.delete(key: 'ff_legs');
  }

  void addToLegs(DocumentReference _value) {
    _legs.add(_value);
    secureStorage.setStringList('ff_legs', _legs.map((x) => x.path).toList());
  }

  void removeFromLegs(DocumentReference _value) {
    _legs.remove(_value);
    secureStorage.setStringList('ff_legs', _legs.map((x) => x.path).toList());
  }

  void removeAtIndexFromLegs(int _index) {
    _legs.removeAt(_index);
    secureStorage.setStringList('ff_legs', _legs.map((x) => x.path).toList());
  }

  void updateLegsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _legs[_index] = updateFn(_legs[_index]);
    secureStorage.setStringList('ff_legs', _legs.map((x) => x.path).toList());
  }

  List<DocumentReference> _abs = [];
  List<DocumentReference> get abs => _abs;
  set abs(List<DocumentReference> _value) {
    _abs = _value;
    secureStorage.setStringList('ff_abs', _value.map((x) => x.path).toList());
  }

  void deleteAbs() {
    secureStorage.delete(key: 'ff_abs');
  }

  void addToAbs(DocumentReference _value) {
    _abs.add(_value);
    secureStorage.setStringList('ff_abs', _abs.map((x) => x.path).toList());
  }

  void removeFromAbs(DocumentReference _value) {
    _abs.remove(_value);
    secureStorage.setStringList('ff_abs', _abs.map((x) => x.path).toList());
  }

  void removeAtIndexFromAbs(int _index) {
    _abs.removeAt(_index);
    secureStorage.setStringList('ff_abs', _abs.map((x) => x.path).toList());
  }

  void updateAbsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _abs[_index] = updateFn(_abs[_index]);
    secureStorage.setStringList('ff_abs', _abs.map((x) => x.path).toList());
  }

  List<int> _sets = [];
  List<int> get sets => _sets;
  set sets(List<int> _value) {
    _sets = _value;
    secureStorage.setStringList(
        'ff_sets', _value.map((x) => x.toString()).toList());
  }

  void deleteSets() {
    secureStorage.delete(key: 'ff_sets');
  }

  void addToSets(int _value) {
    _sets.add(_value);
    secureStorage.setStringList(
        'ff_sets', _sets.map((x) => x.toString()).toList());
  }

  void removeFromSets(int _value) {
    _sets.remove(_value);
    secureStorage.setStringList(
        'ff_sets', _sets.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromSets(int _index) {
    _sets.removeAt(_index);
    secureStorage.setStringList(
        'ff_sets', _sets.map((x) => x.toString()).toList());
  }

  void updateSetsAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _sets[_index] = updateFn(_sets[_index]);
    secureStorage.setStringList(
        'ff_sets', _sets.map((x) => x.toString()).toList());
  }

  List<int> _reps = [];
  List<int> get reps => _reps;
  set reps(List<int> _value) {
    _reps = _value;
    secureStorage.setStringList(
        'ff_reps', _value.map((x) => x.toString()).toList());
  }

  void deleteReps() {
    secureStorage.delete(key: 'ff_reps');
  }

  void addToReps(int _value) {
    _reps.add(_value);
    secureStorage.setStringList(
        'ff_reps', _reps.map((x) => x.toString()).toList());
  }

  void removeFromReps(int _value) {
    _reps.remove(_value);
    secureStorage.setStringList(
        'ff_reps', _reps.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromReps(int _index) {
    _reps.removeAt(_index);
    secureStorage.setStringList(
        'ff_reps', _reps.map((x) => x.toString()).toList());
  }

  void updateRepsAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _reps[_index] = updateFn(_reps[_index]);
    secureStorage.setStringList(
        'ff_reps', _reps.map((x) => x.toString()).toList());
  }

  List<int> _kgs = [];
  List<int> get kgs => _kgs;
  set kgs(List<int> _value) {
    _kgs = _value;
    secureStorage.setStringList(
        'ff_kgs', _value.map((x) => x.toString()).toList());
  }

  void deleteKgs() {
    secureStorage.delete(key: 'ff_kgs');
  }

  void addToKgs(int _value) {
    _kgs.add(_value);
    secureStorage.setStringList(
        'ff_kgs', _kgs.map((x) => x.toString()).toList());
  }

  void removeFromKgs(int _value) {
    _kgs.remove(_value);
    secureStorage.setStringList(
        'ff_kgs', _kgs.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromKgs(int _index) {
    _kgs.removeAt(_index);
    secureStorage.setStringList(
        'ff_kgs', _kgs.map((x) => x.toString()).toList());
  }

  void updateKgsAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _kgs[_index] = updateFn(_kgs[_index]);
    secureStorage.setStringList(
        'ff_kgs', _kgs.map((x) => x.toString()).toList());
  }

  List<bool> _done = [];
  List<bool> get done => _done;
  set done(List<bool> _value) {
    _done = _value;
    secureStorage.setStringList(
        'ff_done', _value.map((x) => x.toString()).toList());
  }

  void deleteDone() {
    secureStorage.delete(key: 'ff_done');
  }

  void addToDone(bool _value) {
    _done.add(_value);
    secureStorage.setStringList(
        'ff_done', _done.map((x) => x.toString()).toList());
  }

  void removeFromDone(bool _value) {
    _done.remove(_value);
    secureStorage.setStringList(
        'ff_done', _done.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromDone(int _index) {
    _done.removeAt(_index);
    secureStorage.setStringList(
        'ff_done', _done.map((x) => x.toString()).toList());
  }

  void updateDoneAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _done[_index] = updateFn(_done[_index]);
    secureStorage.setStringList(
        'ff_done', _done.map((x) => x.toString()).toList());
  }

  List<bool> _liked = [];
  List<bool> get liked => _liked;
  set liked(List<bool> _value) {
    _liked = _value;
    secureStorage.setStringList(
        'ff_liked', _value.map((x) => x.toString()).toList());
  }

  void deleteLiked() {
    secureStorage.delete(key: 'ff_liked');
  }

  void addToLiked(bool _value) {
    _liked.add(_value);
    secureStorage.setStringList(
        'ff_liked', _liked.map((x) => x.toString()).toList());
  }

  void removeFromLiked(bool _value) {
    _liked.remove(_value);
    secureStorage.setStringList(
        'ff_liked', _liked.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromLiked(int _index) {
    _liked.removeAt(_index);
    secureStorage.setStringList(
        'ff_liked', _liked.map((x) => x.toString()).toList());
  }

  void updateLikedAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _liked[_index] = updateFn(_liked[_index]);
    secureStorage.setStringList(
        'ff_liked', _liked.map((x) => x.toString()).toList());
  }

  List<DocumentReference> _others = [];
  List<DocumentReference> get others => _others;
  set others(List<DocumentReference> _value) {
    _others = _value;
    secureStorage.setStringList(
        'ff_others', _value.map((x) => x.path).toList());
  }

  void deleteOthers() {
    secureStorage.delete(key: 'ff_others');
  }

  void addToOthers(DocumentReference _value) {
    _others.add(_value);
    secureStorage.setStringList(
        'ff_others', _others.map((x) => x.path).toList());
  }

  void removeFromOthers(DocumentReference _value) {
    _others.remove(_value);
    secureStorage.setStringList(
        'ff_others', _others.map((x) => x.path).toList());
  }

  void removeAtIndexFromOthers(int _index) {
    _others.removeAt(_index);
    secureStorage.setStringList(
        'ff_others', _others.map((x) => x.path).toList());
  }

  void updateOthersAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _others[_index] = updateFn(_others[_index]);
    secureStorage.setStringList(
        'ff_others', _others.map((x) => x.path).toList());
  }

  bool _iconClick = false;
  bool get iconClick => _iconClick;
  set iconClick(bool _value) {
    _iconClick = _value;
    secureStorage.setBool('ff_iconClick', _value);
  }

  void deleteIconClick() {
    secureStorage.delete(key: 'ff_iconClick');
  }

  bool _likeclick = false;
  bool get likeclick => _likeclick;
  set likeclick(bool _value) {
    _likeclick = _value;
    secureStorage.setBool('ff_likeclick', _value);
  }

  void deleteLikeclick() {
    secureStorage.delete(key: 'ff_likeclick');
  }

  bool _showComment = false;
  bool get showComment => _showComment;
  set showComment(bool _value) {
    _showComment = _value;
    secureStorage.setBool('ff_showComment', _value);
  }

  void deleteShowComment() {
    secureStorage.delete(key: 'ff_showComment');
  }

  List<DocumentReference> _allExercise = [];
  List<DocumentReference> get allExercise => _allExercise;
  set allExercise(List<DocumentReference> _value) {
    _allExercise = _value;
    secureStorage.setStringList(
        'ff_allExercise', _value.map((x) => x.path).toList());
  }

  void deleteAllExercise() {
    secureStorage.delete(key: 'ff_allExercise');
  }

  void addToAllExercise(DocumentReference _value) {
    _allExercise.add(_value);
    secureStorage.setStringList(
        'ff_allExercise', _allExercise.map((x) => x.path).toList());
  }

  void removeFromAllExercise(DocumentReference _value) {
    _allExercise.remove(_value);
    secureStorage.setStringList(
        'ff_allExercise', _allExercise.map((x) => x.path).toList());
  }

  void removeAtIndexFromAllExercise(int _index) {
    _allExercise.removeAt(_index);
    secureStorage.setStringList(
        'ff_allExercise', _allExercise.map((x) => x.path).toList());
  }

  void updateAllExerciseAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _allExercise[_index] = updateFn(_allExercise[_index]);
    secureStorage.setStringList(
        'ff_allExercise', _allExercise.map((x) => x.path).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
