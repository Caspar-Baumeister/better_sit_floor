import 'package:shared_preferences/shared_preferences.dart';

class UsedPosesPreferences {
  static SharedPreferences? _preferences;

  static const _keyUsedPoses = 'usedPoses';

  static Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> set(List<String> usedPoses) async {
    if (_preferences != null) {
      await _preferences!.setStringList(_keyUsedPoses, usedPoses);
    }
  }

  static List<String> get() => _preferences!.getStringList(_keyUsedPoses) ?? [];

  static Future<bool> add(String pose) async {
    if (_preferences != null) {
      List<String> usedPoses = get();
      if (!usedPoses.contains(pose)) {
        usedPoses.add(pose);
        await _preferences!.setStringList(_keyUsedPoses, usedPoses);
        return true;
      }
    }
    return false;
  }

  static Future<bool> remove(String pose) async {
    if (_preferences != null) {
      List<String> usedPoses = get();
      if (usedPoses.contains(pose)) {
        usedPoses.remove(pose);
        await _preferences!.setStringList(_keyUsedPoses, usedPoses);
        return true;
      }
    }
    return false;
  }
}
