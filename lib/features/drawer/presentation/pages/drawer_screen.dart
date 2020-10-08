import 'package:fittrack/common/general/alert_dialog.dart';
import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/features/drawer/presentation/widget/drawer_widget.dart';
import 'package:fittrack/features/login/data/datamodel/login_model.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/icons.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:fittrack/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  Bloc bloc;
  UserData userData;

  CustomDrawer({this.bloc, this.userData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Scr.infinite,
            width: Scr.screenWidth * 0.3,
            child: DrawerList(bloc: bloc),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.02, right: width * 0.02),
              child: decoratedContainer(
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: userData.profileImage != null
                              ? NetworkImage(userData.profileImage)
                              : assetsImage(ic_fitness_person),
                        ),
                        title: labels(text: userData.username ?? guest, color: theme, size: 14),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: labels(
                                text: "W : ${userData.weight ?? '--'} $kg",
                                size: 10,
                              ),
                            ),
                            Expanded(
                              child: labels(
                                text: "H : ${userData.height ?? '--'} $cm",
                                size: 10,
                              ),
                            ),
                          ],
                        ),
                        onTap: () => noLoginAlertDialog(context),
                      ),
                    ),
                    if (userData.userId != null)
                      IconButton(
                        icon: icons(icon: Icons.edit, color: theme, size: height * 0.03),
                        onPressed: () {},
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
