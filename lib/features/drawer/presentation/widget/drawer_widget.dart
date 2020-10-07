import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/features/drawer/presentation/bloc/drawer_event.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/icons.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:fittrack/ui_helper/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerList extends StatelessWidget {
  Bloc bloc;

  DrawerList({this.bloc});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          drawerItem(icon: ic_home, label: home, pageNo: 0),
          drawerItem(icon: ic_bmi, label: current_bmi, pageNo: 1),
          drawerItem(icon: ic_bmr, label: current_bmr, pageNo: 2),
          drawerItem(icon: ic_weight, label: weight_sheet, pageNo: 3),
          drawerItem(icon: ic_food, label: food_directory, pageNo: 4),
          drawerItem(icon: ic_food, label: food_instructions, pageNo: 5),
          drawerItem(icon: ic_chat, label: chat_with_krira, pageNo: 6),
          drawerItem(icon: ic_gallery, label: photo_gallery, pageNo: 7),
          drawerItem(icon: ic_chat, label: chart, pageNo: 8),
          drawerItem(icon: ic_compare, label: compare, pageNo: 9),
          drawerItem(icon: ic_forum, label: forum, pageNo: 10),
          drawerItem(icon: ic_feedback, label: feedback, pageNo: 11),
          drawerItem(icon: ic_share, label: share_app, pageNo: 12),
          drawerItem(icon: ic_logout, label: logout, pageNo: 12),
        ],
      ),
    );
  }

  Widget drawerItem({String icon, String label, int pageNo}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
          child: Container(
            height: 100,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                imageAsset(img: icon, color: theme, height: 40, width: 40),
                verticalSpace(10),
                labels(text: label, size: 14, color: theme),
              ],
            ),
          ),
        ),
        onTap: () => bloc.add(FetchSelectPageEvent(pageNo: pageNo)),
      ),
    );
  }
}
