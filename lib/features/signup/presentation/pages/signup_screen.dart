import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/di/dependency_injection.dart';
import 'package:fittrack/features/home/presentation/widget/home_widget.dart';
import 'package:fittrack/features/signup/presentation/bloc/bloc.dart';
import 'package:fittrack/features/signup/presentation/widget/signup_widget.dart';
import 'package:fittrack/ui_helper/images.dart';
import 'package:fittrack/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  Bloc bloc = getIt<SignUpBloc>();

  String emailValidationMsg = "";
  String passwordValidationMsg = "";
  bool buttonStatus = false;
  bool gender = false;

  @override
  Widget build(BuildContext context) {
    Scr.setScreenSize(context);
    return SafeArea(
      child: Scaffold(
        body: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if (state is GetSignUpEmailState) emailValidationMsg = state.msg;
            if (state is GetSignUpPasswordState) passwordValidationMsg = state.msg;
            if (state is GetSignUpButtonStatusState) buttonStatus = state.status;
            if (state is GetSignUpGenderState) gender = state.gender;
          },
          child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) => Container(
              height: height,
              decoration: boxDecoration(
                image: bg_home_screen2,
                // colorFilter: ColorFilter.mode(black.withOpacity(0.8), BlendMode.dstATop),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imageAsset(img: logo_home_screen, height: height * 0.2),
                    SignUpCard(
                      gender: gender,
                      bloc: bloc,
                      emailMsg: emailValidationMsg,
                      passMsg: passwordValidationMsg,
                      buttonStatus: buttonStatus,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
