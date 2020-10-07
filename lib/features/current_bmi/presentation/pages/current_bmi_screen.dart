import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/features/home/presentation/widget/home_widget.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/images.dart';
import 'package:fittrack/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class CurrentBMIScreen extends StatefulWidget {
  bool animate = true;

  @override
  _CurrentBMIScreenState createState() => _CurrentBMIScreenState();
}

class _CurrentBMIScreenState extends State<CurrentBMIScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: Scr.screenHeight,
      width: Scr.screenWidth,
      decoration: BoxDecoration(
        color: black,
        boxShadow: [
          BoxShadow(blurRadius: 50, color: green100),
          BoxShadow(blurRadius: 50, color: black),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: assetsImage(bg_home_screen),
          colorFilter: ColorFilter.mode(black.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: Scr.screenHeight * 0.25,
            child: Padding(
              padding: EdgeInsets.only(top: Scr.screenHeight * 0.05),
              child: animatorLogo(),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Current BMI",
                style: TextStyle(color: white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
