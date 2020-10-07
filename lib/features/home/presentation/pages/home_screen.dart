import 'package:fittrack/common/general/circular_progress_indicator.dart';
import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/di/dependency_injection.dart';
import 'package:fittrack/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:fittrack/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fittrack/features/home/presentation/bloc/bloc.dart';
import 'package:fittrack/features/home/presentation/widget/home_widget.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/icons.dart';
import 'package:fittrack/ui_helper/images.dart';
import 'package:fittrack/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  Bloc bloc;

  HomePage({this.bloc});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = getIt<HomeBloc>();
  List<String> homeDataList = new List<String>();
  bool isLoading = true;

  @override
  void initState() {
    bloc.add(FetchHomeDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is FetchHomeDataState) {
          homeDataList = state.modelData;
        } else if (state is LoadingBeginHomeState) {
          isLoading = true;
        } else if (state is LoadingEndHomeState) {
          isLoading = false;
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        condition: (currState, oldState) {
          if (currState is FetchHomeDataState) return false;
          return true;
        },
        builder: (BuildContext context, state) {
          return Container(
            alignment: Alignment.centerLeft,
            height: Scr.screenHeight,
            width: Scr.screenWidth,
            decoration: boxDecoration(
              color: black,
              image: bg_home_screen,
              colorFilter: ColorFilter.mode(black.withOpacity(0.8), BlendMode.dstATop),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: imageAsset(img: ic_menubar, height: 34, width: 34),
                      onTap: () =>
                          widget.bloc.add(AnimatePageEvent(animate: !DashBoardScreen.animate)),
                    ),
                  ),
                ),
                Container(
                  height: Scr.screenHeight * 0.25,
                  child: Padding(
                    padding: EdgeInsets.only(top: Scr.screenHeight * 0.05),
                    child: animatorLogo(),
                  ),
                ),
                verticalSpace(Scr.screenHeight * 0.03),
                divider(color: white24, thickness: 2),
                Expanded(child: isLoading ? circularProgressIndicator : dataList(homeDataList)),
              ],
            ),
          );
        },
      ),
    );
  }
}
