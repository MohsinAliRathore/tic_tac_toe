import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/Constants/app_images.dart';
import 'package:tic_tac_toe/screens/symbol_selection.dart';
import '../Theme/app_colors.dart';
import '../Utils/settings_manager.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_state.dart';
import '../widgets/custom_app_bar.dart';
import 'difficulty_screen.dart';
import 'first_move_screen.dart';
import 'game_screen.dart';
import 'multiple_player_move_order_selection.dart';

class ModeSelection extends StatelessWidget {
  const ModeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Select Mode')),
      body: Stack(
        children: [
          SvgPicture.asset(
            AppImages.background,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          CustomAppBar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  final difficulty = await SettingsManager.getDifficulty();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => TicTacToeBloc(),
                        child: SymbolSelection(difficulty: difficulty),
                      ),
                    ),
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
                      Container(
                        height: 35,
                        width: 40,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppImages.userIcon,
                          fit: BoxFit.cover,
                          width: 32,
                          height: 32,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'VS',
                        style: GoogleFonts.pridi(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBlueColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 29,
                        width: 40,
                        child: SvgPicture.asset(
                          AppImages.botIcon,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => TicTacToeBloc(),
                        child: const MultiplayerMoveOrderSelection(),
                      ),
                    ),
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
                      Container(
                        height: 35,
                        width: 40,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppImages.userIcon,
                          fit: BoxFit.cover,
                          width: 32,
                          height: 32,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'VS',
                        style: GoogleFonts.pridi(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBlueColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 35,
                        width: 40,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppImages.userIcon,
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
        ],
      ),
    );
  }
}
