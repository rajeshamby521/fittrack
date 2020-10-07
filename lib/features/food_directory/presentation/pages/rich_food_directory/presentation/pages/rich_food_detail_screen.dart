import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/presentation/widget/rich_food_widget.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:fittrack/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class RichFoodDetailScreen extends StatelessWidget {
  RichFoodModel data;

  RichFoodDetailScreen({this.data});

  @override
  Widget build(BuildContext context) {
    List<Widget> detailsData = [
      rowData(label: servingSize, data: data.size.toString() + " g"),
      rowData(label: calories, data: data.calories.toString()),
      rowData(label: "Total $fat", data: data.fat.toString() + " g"),
      rowData(label: saturatedFat, data: data.saturatedFat.toString() + " g"),
      rowData(label: polyUnsaturatedFat, data: data.polyUnsaturatedFat.toString() + " g"),
      rowData(label: monoUnsaturatedFat, data: data.monoUnsaturatedFat.toString() + " g"),
      rowData(label: "Total $carbs", data: data.carbs.toString() + " g"),
      rowData(label: dietaryFiber, data: data.dietaryFiber.toString() + " g"),
      rowData(label: sugar, data: data.sugar.toString() + " g"),
      rowData(label: protein, data: data.protein.toString() + " g"),
      rowData(label: cholesterol, data: data.cholesterol.toString() + " mg"),
      rowData(label: sodium, data: data.sodium.toString() + " mg"),
      rowData(label: potassium, data: data.potassium.toString() + " mg"),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme,
          title: labels(text: details),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: imageNetwork(img: data.image, height: height * 0.3),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: labels(text: data.name.toUpperCase(), color: theme, size: 20),
            ),
            listDivider(padding: 20),
            Expanded(
              child: ListView(
                itemExtent: 20,
                children: detailsData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
