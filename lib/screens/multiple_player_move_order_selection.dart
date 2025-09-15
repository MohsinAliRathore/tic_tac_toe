import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game_bloc.dart';
import '../bloc/game_state.dart';
import 'game_screen.dart';

class MultiplayerMoveOrderSelection extends StatelessWidget {
  const MultiplayerMoveOrderSelection({super.key});

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
                      child: MultiplayerSymbolSelection(firstPlayer: 'Player 1'),
                    ),
                  ),
                );
              },
              child: const Text('Player 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => TicTacToeBloc(),
                      child: MultiplayerSymbolSelection(firstPlayer: 'Player 2'),
                    ),
                  ),
                );
              },
              child: const Text('Player 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiplayerSymbolSelection extends StatelessWidget {
  final String firstPlayer;

  const MultiplayerSymbolSelection({super.key, required this.firstPlayer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$firstPlayer: Choose Symbol')),
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
                        isAI: false,
                        firstMove: Player.x,
                        userSymbol: Player.x,
                        firstPlayer: firstPlayer,
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
                      child: GameScreen(
                        isAI: false,
                        firstMove: Player.o,
                        userSymbol: Player.o,
                        firstPlayer: firstPlayer,
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