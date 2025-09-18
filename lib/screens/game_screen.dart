import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/app_images.dart';
import '../Theme/app_colors.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_event.dart';
import '../bloc/game_state.dart';
import '../models/game_stats_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/line_painter.dart';
import '../widgets/player_widget.dart';
import 'menu_screen.dart';

class GameScreen extends StatefulWidget {
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
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _dialogShown = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TicTacToeBloc>().add(
        StartGameEvent(
          isAI: widget.isAI,
          difficulty: widget.difficulty,
          firstMove: widget.firstMove,
          userSymbol: widget.userSymbol,
          firstPlayer: widget.firstPlayer,
        ),
      );
    });

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tic Tac Toe'),
      //   backgroundColor: Colors.blue[800],
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.home, color: Colors.white),
      //       onPressed: () {
      //         GameStats.clear();
      //         Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(builder: (context) => const MainMenu()),
      //         );
      //       },
      //     ),
      //   ],
      // ),
      body: BlocBuilder<TicTacToeBloc, TicTacToeState>(
        builder: (context, state) {
          String turnMessage;
          if (state.isAI) {
            turnMessage = state.currentPlayer == state.userSymbol
                ? 'Your Turn'
                : 'AI\'s Turn';
          } else {
            turnMessage =
                state.firstPlayer == 'Player 1' &&
                        state.currentPlayer == state.firstMove ||
                    state.firstPlayer == 'Player 2' &&
                        state.currentPlayer != state.firstMove
                ? 'Player 1\'s Turn'
                : 'Player 2\'s Turn';
          }

          if (state.gameOver && !_dialogShown) {
            _dialogShown = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              String winMessage;
              if (state.winner != Player.none) {
                if (state.isAI) {
                  winMessage = state.winner == state.userSymbol
                      ? 'User Wins!'
                      : 'AI Wins!';
                } else {
                  winMessage =
                      state.firstPlayer == 'Player 1' &&
                              state.winner == state.firstMove ||
                          state.firstPlayer == 'Player 2' &&
                              state.winner != state.firstMove
                      ? 'Player 1 Wins!'
                      : 'Player 2 Wins!';
                }
              } else {
                winMessage = 'It\'s a Draw!';
              }

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (dialogContext) => AlertDialog(
                  backgroundColor: Colors.white,
                  content: Container(
                    height: 400,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: SvgPicture.asset(
                            AppImages.starIcon,
                            fit: BoxFit.cover,
                            width: 70,
                            height: 70,
                            color: AppColors.yellowColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 30),
                          child: Text(
                            winMessage,
                            style: GoogleFonts.pridi(
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                              color: AppColors.yellowColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            GameStats.clear();
                            Navigator.pushAndRemoveUntil(
                              dialogContext,
                              MaterialPageRoute(
                                builder: (context) => const MainMenu(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Container(
                            height: 57,
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsetsGeometry.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              gradient: AppColors
                                  .buttonYellowGradientColor, // Apply gradient from AppColors
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ), // Stadium-like shape
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26, // Shadow color
                                  blurRadius: 8, // Shadow blur
                                  offset: Offset(0, 4), // Shadow offset
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Home',
                                  style: GoogleFonts.pridi(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryBlueColor,
                                  ),
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: SvgPicture.asset(
                                    AppImages.homeIcon,
                                    fit: BoxFit.cover,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<TicTacToeBloc>().add(
                              ResetBoardEvent(),
                            );
                            setState(() {
                              _dialogShown = false;
                            });
                            Navigator.of(dialogContext).pop();
                          },
                          child: Container(
                            height: 57,
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsetsGeometry.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              gradient: AppColors
                                  .buttonYellowGradientColor, // Apply gradient from AppColors
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ), // Stadium-like shape
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26, // Shadow color
                                  blurRadius: 8, // Shadow blur
                                  offset: Offset(0, 4), // Shadow offset
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Retry',
                                  style: GoogleFonts.pridi(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryBlueColor,
                                  ),
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: SvgPicture.asset(
                                    AppImages.retryIcon,
                                    fit: BoxFit.cover,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          }
          return Stack(
            children: [
              SvgPicture.asset(
                AppImages.background,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              CustomAppBar(isGameScreen: true),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!state.gameOver)
                      Text(
                        turnMessage,
                        style: GoogleFonts.pridi(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.yellowColor,
                        ),
                      ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                            padding: const EdgeInsets.all(12),
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              int row = index ~/ 3;
                              int col = index % 3;
                              bool isTapped =
                                  state.board[row][col] != Player.none;
                              return GestureDetector(
                                onTap: () {
                                  if (state.isAI &&
                                      state.currentPlayer != state.userSymbol)
                                    return;
                                  context.read<TicTacToeBloc>().add(
                                    MakeMoveEvent(row, col),
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  transform: Matrix4.identity()
                                    ..scale(isTapped ? 0.95 : 1.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: AppColors.primaryBlueColor,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: state.board[row][col] == Player.x
                                      ? XWidget(isTapped: isTapped)
                                      : state.board[row][col] == Player.o
                                      ? OWidget(isTapped: isTapped)
                                      : const SizedBox.shrink(),
                                ),
                              );
                            },
                          ),
                          if (state.winningCombo.isNotEmpty)
                            LinePainter(winningCombo: state.winningCombo),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
