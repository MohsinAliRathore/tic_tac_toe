enum Player { x, o, none }
enum Difficulty { easy, medium, hard }

class TicTacToeState {
  final List<List<Player>> board;
  final Player currentPlayer;
  final Player winner;
  final List<int> winningCombo;
  final bool gameOver;
  final bool isAI;
  final Difficulty? difficulty;

  TicTacToeState({
    required this.board,
    required this.currentPlayer,
    this.winner = Player.none,
    this.winningCombo = const [],
    this.gameOver = false,
    required this.isAI,
    this.difficulty,
  });

  TicTacToeState copyWith({
    List<List<Player>>? board,
    Player? currentPlayer,
    Player? winner,
    List<int>? winningCombo,
    bool? gameOver,
    bool? isAI,
    Difficulty? difficulty,
  }) {
    return TicTacToeState(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner ?? this.winner,
      winningCombo: winningCombo ?? this.winningCombo,
      gameOver: gameOver ?? this.gameOver,
      isAI: isAI ?? this.isAI,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}