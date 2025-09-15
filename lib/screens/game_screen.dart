import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_event.dart';
import '../bloc/game_state.dart';
import '../models/game_stats_model.dart';
import '../widgets/line_painter.dart';
import '../widgets/player_widget.dart';
import 'menu_screen.dart';


class GameScreen extends StatelessWidget {
  final bool isAI;
  final Difficulty? difficulty;
  final Player firstMove;
  final Player userSymbol;
  final String firstPlayer;

  const GameScreen({
    super.key,
    required this.isAI,
    this.difficulty,
    required this.firstMove,
    required this.userSymbol,
    required this.firstPlayer,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TicTacToeBloc>().add(StartGameEvent(
        isAI: isAI,
        difficulty: difficulty,
        firstMove: firstMove,
        userSymbol: userSymbol,
        firstPlayer: firstPlayer,
      ));
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {
              GameStats.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainMenu()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<TicTacToeBloc, TicTacToeState>(
        builder: (context, state) {
          String winMessage;
          if (state.winner != Player.none) {
            if (state.isAI) {
              winMessage = state.winner == state.userSymbol ? 'User Wins!' : 'AI Wins!';
            } else {
              winMessage = state.firstPlayer == 'Player 1' && state.winner == state.firstMove ||
                  state.firstPlayer == 'Player 2' && state.winner != state.firstMove
                  ? 'Player 1 Wins!'
                  : 'Player 2 Wins!';
            }
          } else {
            winMessage = 'It\'s a Draw!';
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      state.isAI ? 'User: ${GameStats.userWins}' : 'Player 1: ${GameStats.player1Wins}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    Text(
                      state.isAI ? 'AI: ${GameStats.aiWins}' : 'Player 2: ${GameStats.player2Wins}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                    Text(
                      'Draws: ${GameStats.draws}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[100]!, Colors.blue[300]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      padding: const EdgeInsets.all(12),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        int row = index ~/ 3;
                        int col = index % 3;
                        bool isTapped = state.board[row][col] != Player.none;
                        return GestureDetector(
                          onTap: () {
                            if (state.isAI && state.currentPlayer != state.userSymbol) return;
                            context.read<TicTacToeBloc>().add(MakeMoveEvent(row, col));
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            transform: Matrix4.identity()..scale(isTapped ? 0.95 : 1.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.blue[800]!, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: state.board[row][col] == Player.x
                                  ? XWidget(isTapped: isTapped)
                                  : state.board[row][col] == Player.o
                                  ? OWidget(isTapped: isTapped)
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        );
                      },
                    ),
                    if (state.winningCombo.isNotEmpty)
                      LinePainter(winningCombo: state.winningCombo),
                  ],
                ),
              ),
              if (state.gameOver)
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      winMessage,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<TicTacToeBloc>().add(ResetBoardEvent());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Play Again',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}