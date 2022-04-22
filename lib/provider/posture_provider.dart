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

  set postures(List<PostureModel> postures) {
    _postures = postures;
    notifyListeners();
  }

  set arePosturesUsed(Map<int, bool> arePosturesUsed) {
    _arePosturesUsed = arePosturesUsed;
    notifyListeners();
  }

  Future loadData() async {
    postureData.forEach((key, value) {
      _postures.add(PostureModel.fromJson(value, key));
      _arePosturesUsed[key] = true;
    });
    _postures.shuffle();
    initialized = true;
    notifyListeners();
  }
}
