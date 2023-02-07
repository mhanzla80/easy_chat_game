import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final Prefs _instance = Prefs._internal();
  static Prefs get instance => _instance;

  factory Prefs() => _instance;
  Prefs._internal();

  static late SharedPreferences _prefs;

  static const keyLevelCompletedCount = "LEVEL_COMPLETED_COUNT";

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  Future<bool> incrementCompletedLevelCount() =>
      _prefs.setInt(keyLevelCompletedCount, getCompletedLevelCount() + 1);

  int getCompletedLevelCount() => _prefs.getInt(keyLevelCompletedCount) ?? 0;
}
