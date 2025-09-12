import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Utils/settings_manager.dart';
import '../bloc/game_bloc.dart';
import 'first_move_screen.dart';
import 'game_screen.dart';

class ModeSelection extends StatelessWidget {
  const ModeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Mode')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final difficulty = await SettingsManager.getDifficulty();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => TicTacToeBloc(),
                      child: GameScreen(
                        isAI: true,
                        difficulty: difficulty,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Play with AI'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstMoveSelection(isAI: false)),
                );
              },
              child: const Text('Multiplayer'),
            ),
          ],
        ),
      ),
    );
  }
}