import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';

abstract class RichFoodDataSource {
  List<RichFoodModel> fetchRichFoodData();
}
