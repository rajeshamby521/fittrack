import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/presentation/pages/rich_food_detail_screen.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:fittrack/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget listItem({Datum data, Bloc bloc, BuildContext context}) {
  return InkWell(
    child: Card(
      elevation: 10,
      margin: horizontalPadding(padding: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: height * 0.2,
                    child: Hero(
                      tag: data.foodImage,
                      child: imageNetwork(img: data.foodImage),
                    ),
                  ),
                  // Container(
                  //   height: height * 0.2,
                  //   child: imageNetwork(img: data.foodImage),
                  // ),
                  verticalSpace(5),
                  rowData(label: servingSize, data: data.servingSize),
                ],
              ),
              flex: 4,
            ),
            Expanded(
              child: Column(
                children: [
                  labels(text: data.foodTitle, color: theme, size: 16),
                  verticalSpace(10),
                  rowData(label: calorie, data: data.calories.toString()),
                  verticalSpace(5),
                  rowData(label: fat, data: data.totalFat),
                  verticalSpace(5),
                  rowData(label: carbs, data: data.totalCarbohydrate),
                  verticalSpace(5),
                  rowData(label: protein, data: data.protein),
                ],
              ),
              flex: 4,
            ),
            Expanded(
              child: icons(icon: Icons.chevron_right, size: 50, color: red),
              flex: 1,
            )
          ],
        ),
      ),
    ),
    onTap: () {
      // data.foodId == "2"
      //     ?
      showModalBottomSheet(
        context: context,
        backgroundColor: white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        builder: (context) {
          return RichFoodDetailScreen(
            bloc: bloc,
            foodId: data.foodId,
            img: data.foodImage,
            name: data.foodTitle,
            n: 1,
          );
        },
      );
      // : Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) => RichFoodDetailScreen(
      //         bloc: bloc,
      //         foodId: data.foodId,
      //         img: data.foodImage,
      //         name: data.foodTitle,
      //         n: 0,
      //       ),
      //     ),
      //   );
    },
  );
}

Widget rowData({String label, String data}) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: labels(text: label, textAlign: TextAlign.end)),
        Text("  :  "),
        Expanded(child: labels(text: data, color: red, textAlign: TextAlign.start)),
      ],
    );
