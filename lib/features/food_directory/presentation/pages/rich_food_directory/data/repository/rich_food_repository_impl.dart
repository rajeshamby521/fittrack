
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_source/rich_food_datasource.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/domain/repository/rich_food_repository.dart';

class RichFoodRepositoryImpl extends RichFoodRepository {
  RichFoodDataSource richFoodDataSource;

  RichFoodRepositoryImpl({this.richFoodDataSource});

  @override
  List<RichFoodModel> getRichFoodData() => richFoodDataSource.fetchRichFoodData();
}
