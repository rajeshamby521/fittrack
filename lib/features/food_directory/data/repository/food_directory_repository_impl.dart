import 'package:fittrack/features/food_directory/data/dataSource/food_directory_datasource.dart';
import 'package:fittrack/features/food_directory/domain/repository/food_directory_repository.dart';

class FoodDirectoryRepositoryImpl extends FoodDirectoryRepository {
  FoodDirectoryDataSource foodDirectoryDataSource;

  FoodDirectoryRepositoryImpl({this.foodDirectoryDataSource});

  @override
  List<String> getFoodDirectoryData() => foodDirectoryDataSource.fetchFoodDirectoryData();
}
