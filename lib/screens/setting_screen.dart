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
import 'difficulty_screen.dart';
import 'menu_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Difficulty _selectedDifficulty = Difficulty.easy;

  @override
  void initState() {
    super.initState();
    _loadDifficulty();
  }

  Future<void> _loadDifficulty() async {
    Difficulty difficulty = await SettingsManager.getDifficulty();
    setState(() {
      _selectedDifficulty = difficulty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  'Select AI Difficulty',
                  style: GoogleFonts.pridi(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.yellowColor,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    SettingsManager.setDifficulty(Difficulty.easy);
                    setState(() {
                      _selectedDifficulty = Difficulty.easy;
                    });
                    Navigator.pop(context);
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
                    child: Text(
                      'Easy',
                      style: GoogleFonts.pridi(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlueColor,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    SettingsManager.setDifficulty(Difficulty.medium);
                    setState(() {
                      _selectedDifficulty = Difficulty.medium;
                    });
                    Navigator.pop(context);
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
                    child: Text(
                      'Medium',
                      style: GoogleFonts.pridi(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlueColor,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    SettingsManager.setDifficulty(Difficulty.hard);
                    setState(() {
                      _selectedDifficulty = Difficulty.hard;
                    });
                    Navigator.pop(context);
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
                    child: Text(
                      'Hard',
                      style: GoogleFonts.pridi(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlueColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
