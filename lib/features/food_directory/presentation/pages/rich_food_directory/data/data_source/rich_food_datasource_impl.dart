import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_source/rich_food_datasource.dart';
import 'package:fittrack/features/food_directory/static_data.dart';
import 'package:fittrack/ui_helper/strings.dart';

class RichFoodDataSourceImpl extends RichFoodDataSource {
  static String _foodType = fatRichFood;

  static setAgeData({String foodType = fat}) {
    _foodType = foodType;
  }

  @override
  List<RichFoodModel> fetchRichFoodData() {
    if (_foodType == fatRichFood) return fatData;
    if (_foodType == proteinRichFood) return proteinData;
    if (_foodType == carbsRichFood) return carbsData;
  }
}
