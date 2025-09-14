import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/Constants/app_images.dart';

class XWidget extends StatelessWidget {
  final bool isTapped;

  const XWidget({super.key, required this.isTapped});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isTapped ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceOut,
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          AppImages.xIcon,
          width: 50,
          height: 50,
          colorFilter: ColorFilter.mode(Colors.blue[800]!, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class OWidget extends StatelessWidget {
  final bool isTapped;

  const OWidget({super.key, required this.isTapped});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isTapped ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceOut,
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          AppImages.oIcon,
          width: 50,
          height: 50,
          colorFilter: ColorFilter.mode(Colors.orange[800]!, BlendMode.srcIn),
        ),
      ),
    );
  }
}