import 'package:fittrack/features/food_directory/data/dataModel/food_directory_model.dart';

abstract class FoodDirectoryDataSource {
  Future<FoodCategoryModel> fetchFoodDirectoryData();
}
