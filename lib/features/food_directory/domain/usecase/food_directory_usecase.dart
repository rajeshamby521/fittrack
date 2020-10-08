import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/food_directory/data/dataModel/food_directory_model.dart';
import 'package:fittrack/features/food_directory/domain/repository/food_directory_repository.dart';
import 'package:fittrack/usecase/usecase.dart';

class FoodDirectoryUseCase extends UseCase<FoodCategoryModel, FoodDirectoryDataParams> {
  FoodDirectoryRepository foodDirectoryRepository;

  FoodDirectoryUseCase({this.foodDirectoryRepository});

  @override
  Future<Either<Failure, FoodCategoryModel>> call(FoodDirectoryDataParams params) async {
    return await foodDirectoryRepository.getFoodDirectoryData();
  }
}

class FoodDirectoryDataParams extends Equatable {
  FoodDirectoryDataParams();
}
