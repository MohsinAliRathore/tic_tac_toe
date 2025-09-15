import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/widgets/custom_app_bar.dart';
import '../Constants/app_images.dart';
import '../Theme/app_colors.dart';
import '../Utils/settings_manager.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_state.dart';
import 'game_screen.dart';

class FirstMoveSelection extends StatelessWidget {
  final bool isAI;

  const FirstMoveSelection({super.key, required this.isAI});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Who Moves First?')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final difficulty = isAI ? await SettingsManager.getDifficulty() : null;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => TicTacToeBloc(),
                      child: GameScreen(
                        isAI: isAI,
                        difficulty: difficulty,
                        firstMove: Player.x,
                        userSymbol: Player.x,
                        firstPlayer: isAI ? 'User' : 'Player 1',
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Player X'),
            ),
            ElevatedButton(
              onPressed: () async {
                final difficulty = isAI ? await SettingsManager.getDifficulty() : null;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => TicTacToeBloc(),
                      child: GameScreen(
                        isAI: isAI,
                        difficulty: difficulty,
                        firstMove: Player.o,
                        userSymbol: Player.o,
                        firstPlayer: isAI ? 'User' : 'Player 1',
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Player O'),
            ),
          ],
        ),
      ),
    );
  }
}