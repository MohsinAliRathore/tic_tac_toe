import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/game_state.dart';

class SettingsManager {
  static const String _difficultyKey = 'ai_difficulty';

  static Future<Difficulty> getDifficulty() async {
    final prefs = await SharedPreferences.getInstance();
    final difficultyString = prefs.getString(_difficultyKey);
    switch (difficultyString) {
      case 'medium':
        return Difficulty.medium;
      case 'hard':
        return Difficulty.hard;
      default:
        return Difficulty.easy;
    }
  }

  static Future<void> setDifficulty(Difficulty difficulty) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_difficultyKey, difficulty.toString().split('.').last);
  }
}