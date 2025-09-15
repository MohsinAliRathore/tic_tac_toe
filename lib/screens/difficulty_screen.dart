import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/screens/symbol_selection.dart';
import '../Utils/settings_manager.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_state.dart';
import 'menu_screen.dart';

class DifficultySelection extends StatelessWidget {
  const DifficultySelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Difficulty')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SettingsManager.setDifficulty(Difficulty.easy);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainMenu()),
                      (route) => false,
                );
              },
              child: const Text('Easy'),
            ),
            ElevatedButton(
              onPressed: () {
                SettingsManager.setDifficulty(Difficulty.medium);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainMenu()),
                      (route) => false,
                );
              },
              child: const Text('Medium'),
            ),
            ElevatedButton(
              onPressed: () {
                SettingsManager.setDifficulty(Difficulty.hard);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainMenu()),
                      (route) => false,
                );
              },
              child: const Text('Hard'),
            ),
          ],
        ),
      ),
    );
  }
}