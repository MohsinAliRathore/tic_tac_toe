

import 'game_state.dart';

abstract class TicTacToeEvent {}

class MakeMoveEvent extends TicTacToeEvent {
  final int row;
  final int col;
  MakeMoveEvent(this.row, this.col);
}

class ResetBoardEvent extends TicTacToeEvent {}

class StartGameEvent extends TicTacToeEvent {
  final bool isAI;
  final Difficulty? difficulty;
  final Player firstMove;
  final Player userSymbol;
  final String firstPlayer;
  StartGameEvent({
    required this.isAI,
    this.difficulty,
    required this.firstMove,
    required this.userSymbol,
    required this.firstPlayer,
  });
}