import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Utils/settings_manager.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_state.dart';
import 'game_screen.dart';

class SymbolSelection extends StatelessWidget {
  final Difficulty difficulty;

  const SymbolSelection({super.key, required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Symbol')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => TicTacToeBloc(),
                      child: AIMoveOrderSelection(
                        userSymbol: Player.x,
                        difficulty: difficulty,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Play as X'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => TicTacToeBloc(),
                      child: AIMoveOrderSelection(
                        userSymbol: Player.o,
                        difficulty: difficulty,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Play as O'),
            ),
          ],
        ),
      ),
    );
  }
}

class AIMoveOrderSelection extends StatelessWidget {
  final Player userSymbol;
  final Difficulty difficulty;

  const AIMoveOrderSelection({
    super.key,
    required this.userSymbol,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Who Moves First?')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => TicTacToeBloc(),
                      child: GameScreen(
                        isAI: true,
                        difficulty: difficulty,
                        firstMove: userSymbol,
                        userSymbol: userSymbol,
                        firstPlayer: 'User',
                      ),
                    ),
                  ),
                );
              },
              child: const Text('I Move First'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => TicTacToeBloc(),
                      child: GameScreen(
                        isAI: true,
                        difficulty: difficulty,
                        firstMove: userSymbol == Player.x ? Player.o : Player.x,
                        userSymbol: userSymbol,
                        firstPlayer: 'AI',
                      ),
                    ),
                  ),
                );
              },
              child: const Text('AI Moves First'),
            ),
          ],
        ),
      ),
    );
  }
}