import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/app_images.dart';
import '../Theme/app_colors.dart';
import '../models/game_stats_model.dart';
import '../screens/menu_screen.dart';
import '../screens/setting_screen.dart';

class CustomAppBar extends StatelessWidget {
  final bool isGameScreen;
  const CustomAppBar({super.key, this.isGameScreen = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (isGameScreen) {
                  GameStats.clear();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainMenu()),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: Container(
                height: 48,
                width: 48,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.white, width: 2.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26, // Shadow color
                      blurRadius: 8, // Shadow blur
                      offset: Offset(0, 4), // Shadow offset
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(
                    AppImages.backIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              child: Container(
                height: 48,
                width: 48,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.white, width: 2.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26, // Shadow color
                      blurRadius: 8, // Shadow blur
                      offset: Offset(0, 4), // Shadow offset
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(
                    AppImages.settingsIcon,
                    fit: BoxFit.cover,
                    color: AppColors.yellowColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
