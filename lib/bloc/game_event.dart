

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
  StartGameEvent(this.isAI, this.difficulty, this.firstMove);
}