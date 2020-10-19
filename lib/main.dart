import 'dart:convert';
import 'package:device_info/device_info.dart';
import 'package:fittrack/features/drawer/presentation/pages/drawer_screen.dart';
import 'package:fittrack/di/dependency_injection.dart';
import 'package:fittrack/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fittrack/features/home/presentation/widget/home_widget.dart';
import 'package:fittrack/features/login/data/datamodel/login_model.dart';
import 'package:fittrack/features/login/presentation/pages/login_screen.dart';
import 'package:fittrack/network/api_strings.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/images.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:fittrack/utils/app_preference.dart';
import 'package:fittrack/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/drawer/presentation/bloc/bloc.dart';

import 'dart:io' show Platform;

Future<String> _getToken() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor;
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId;
  }
}

setUpAll() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetServiceLocator();
  AppPreference.init();
  String deviceToken = await _getToken();
  AppPreference.set(device_token, deviceToken);
}

Future<void> main() async {
  await setUpAll();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: fitTrack,
      theme: ThemeData(
        cursorColor: theme,
         primaryColor: theme
      ),
      home: LogInScreen(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int page;
  final bloc = getIt<DrawerBloc>();
  bool isLoading = true;
  UserData userDetails = UserData();

  @override
  void initState() {
    if (AppPreference.getString(userData) != null) {
      userDetails = UserData.fromMap(jsonDecode(AppPreference.getString(userData)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Scr.setScreenSize(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    bloc.add(FetchSelectPageEvent(pageNo: 0));
    return Scaffold(
      backgroundColor: home_background,
      body: SafeArea(
        child: BlocListener(
          cubit: bloc,
          listener: (BuildContext context, state) {
            if (state is LoadingBeginHomeState) {
              isLoading = true;
            } else if (state is LoadingEndHomeState) {
              isLoading = false;
            } else if (state is FetchSelectPageState) {
              page = state.pageNo;
            }
          },
          child: BlocBuilder(
            cubit: bloc,
            builder: (BuildContext context, state) {
              // return LogInScreen();
              return Stack(
                children: [
                  Container(
                    child: logoImage(
                      image: bg_login,
                      height: Scr.infinite,
                      width: Scr.infinite,
                    ),
                  ),
                  CustomDrawer(bloc: bloc, userData: userDetails),
                  DashBoardScreen(pageNo: page),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
