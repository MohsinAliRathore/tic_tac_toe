import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/app_images.dart';
import '../Theme/app_colors.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_state.dart';
import '../widgets/custom_app_bar.dart';
import 'game_screen.dart';

class MultiplayerMoveOrderSelection extends StatelessWidget {
  const MultiplayerMoveOrderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Who Moves First?')),
      body: Stack(
        children: [
          SvgPicture.asset(
            AppImages.background,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          CustomAppBar(),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => TicTacToeBloc(),
                                  child: MultiplayerSymbolSelection(
                                    firstPlayer: 'Player 1',
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            padding: EdgeInsets.all(25.0),
                            decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26, // Shadow color
                                  blurRadius: 0, // Shadow blur
                                  offset: Offset(0, 4), // Shadow offset
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              AppImages.userIcon,
                              fit: BoxFit.cover,
                              color: AppColors.primaryBlueColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Text(
                            'Player 1',
                            style: GoogleFonts.pridi(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: AppColors.yellowColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => TicTacToeBloc(),
                                  child: MultiplayerSymbolSelection(
                                    firstPlayer: 'Player 2',
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            padding: EdgeInsets.all(25.0),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlueColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26, // Shadow color
                                  blurRadius: 0, // Shadow blur
                                  offset: Offset(0, 4), // Shadow offset
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              AppImages.userIcon,
                              fit: BoxFit.cover,
                              color: AppColors.yellowColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Text(
                            'Player 2',
                            style: GoogleFonts.pridi(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: AppColors.yellowColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
      //appBar: AppBar(title: Text('$firstPlayer: Choose Symbol')),
      body: Stack(
        children: [
          SvgPicture.asset(
            AppImages.background,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          CustomAppBar(),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 23),
                  child: Text(
                    'Select $firstPlayer',
                    style: GoogleFonts.pridi(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.yellowColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
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
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: AppColors.yellowColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          border: Border.all(color: Colors.white, width: 2.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26, // Shadow color
                              blurRadius: 0, // Shadow blur
                              offset: Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          AppImages.xIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
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
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlueColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          border: Border.all(color: Colors.white, width: 2.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26, // Shadow color
                              blurRadius: 0, // Shadow blur
                              offset: Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          AppImages.oIcon,
                          fit: BoxFit.cover,
                          color: AppColors.yellowColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
