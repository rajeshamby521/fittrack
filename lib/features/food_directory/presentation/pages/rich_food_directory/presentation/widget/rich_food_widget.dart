import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:fittrack/utils/screen_utils.dart';
import 'package:flutter/material.dart';

Widget listItem({RichFoodModel data}) {
  return Card(
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
                  child: imageNetwork(img: data.image),
                ),
                verticalSpace(5),
                rowData(label: servingSize, data: "${data.size} g"),
              ],
            ),
            flex: 3,
          ),
          Expanded(
            child: Column(
              children: [
                labels(text: data.name, color: theme, size: 16),
                verticalSpace(10),
                rowData(label: calorie, data: data.calories.toString()),
                verticalSpace(5),
                rowData(label: fat, data: "${data.fat} g"),
                verticalSpace(5),
                rowData(label: carbs, data: "${data.carbs} g"),
                verticalSpace(5),
                rowData(label: protein, data: "${data.protein} g"),
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
