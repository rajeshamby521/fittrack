import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/food_directory/data/dataModel/food_directory_model.dart';

abstract class FoodDirectoryRepository {
  Future<Either<Failure, FoodCategoryModel>> getFoodDirectoryData();
}
