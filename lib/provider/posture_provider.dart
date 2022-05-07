import 'package:better_sit_floor/preferences/used_poses.dart';
import 'package:flutter/material.dart';
import 'package:better_sit_floor/data/postures.dart';
import 'package:better_sit_floor/model/posture.dart';

class PostureProvider extends ChangeNotifier {
  List<PostureModel> _postures = [];
  Map<int, bool> _arePosturesUsed = {};
  bool initialized = false;

  List<PostureModel> get postures => _postures;
  Map<int, bool> get arePosturesUsed => _arePosturesUsed;

  PostureModel getById(int id) => _postures.firstWhere(
        (element) => element.id == id,
      );

  PostureProvider() {
    loadData();
  }

  bool isItemUsed(int id) {
    return _arePosturesUsed[id]!;
  }

  List<PostureModel> getUsedPostures() {
    return List<PostureModel>.from(
        _postures.where((pose) => _arePosturesUsed[pose.id]!));
  }

  swapItemUsed(int id) {
    _arePosturesUsed[id] = !_arePosturesUsed[id]!;
    if (!_arePosturesUsed.containsValue(true)) {
      _arePosturesUsed[id] = !_arePosturesUsed[id]!;
    }
    safeUsedPoses();
    notifyListeners();
  }

  set postures(List<PostureModel> postures) {
    _postures = postures;
    notifyListeners();
  }

  set arePosturesUsed(Map<int, bool> arePosturesUsed) {
    _arePosturesUsed = arePosturesUsed;
    notifyListeners();
  }

  safeUsedPoses() {
    List<String> userPostureStringList = [];

    _arePosturesUsed.forEach((key, value) {
      if (value) {
        userPostureStringList.add(key.toString());
      }
      UsedPosesPreferences.set(userPostureStringList);
    });
  }

  loadUsedPoses() {
    List<String> userPostureStringList = UsedPosesPreferences.get();

    if (userPostureStringList.isEmpty) {
      postureData.forEach((key, value) {
        _arePosturesUsed[key] = true;
      });
    }
    //print(_arePosturesUsed);
    else {
      Map<int, bool> _arePosturesUsedNew = {};
      for (var element in _postures) {
        if (userPostureStringList.contains(element.id.toString())) {
          _arePosturesUsedNew[element.id.toInt()] = true;
        } else {
          _arePosturesUsedNew[element.id.toInt()] = false;
        }
      }
      _arePosturesUsed = _arePosturesUsedNew;
    }
  }

  Future loadData() async {
    postureData.forEach((key, value) {
      _postures.add(PostureModel.fromJson(value, key));
      //_arePosturesUsed[key] = true;
    });
    loadUsedPoses();
    _postures.shuffle();
    initialized = true;
    notifyListeners();
  }
}
