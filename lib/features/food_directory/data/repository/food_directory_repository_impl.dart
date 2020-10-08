import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/food_directory/data/dataModel/food_directory_model.dart';
import 'package:fittrack/features/food_directory/data/dataSource/food_directory_datasource.dart';
import 'package:fittrack/features/food_directory/domain/repository/food_directory_repository.dart';

class FoodDirectoryRepositoryImpl extends FoodDirectoryRepository {
  FoodDirectoryDataSource foodDirectoryDataSource;

  FoodDirectoryRepositoryImpl({this.foodDirectoryDataSource});

  @override
  Future<Either<Failure, FoodCategoryModel>> getFoodDirectoryData() async {
    final result = await foodDirectoryDataSource.fetchFoodDirectoryData();
    return Right(result);
  }
}
