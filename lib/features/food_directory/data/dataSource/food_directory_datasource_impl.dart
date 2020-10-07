import 'package:fittrack/features/food_directory/data/dataSource/food_directory_datasource.dart';
import 'package:fittrack/ui_helper/strings.dart';

class FoodDirectoryDataSourceImpl extends FoodDirectoryDataSource {
  List<String> _list = [fatRichFood, proteinRichFood, carbsRichFood];

  @override
  List<String> fetchFoodDirectoryData() => _list;
}
