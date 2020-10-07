import 'package:fittrack/features/food_directory/domain/repository/food_directory_repository.dart';

class FoodDirectoryUseCase {
  FoodDirectoryRepository foodDirectoryRepository;

  FoodDirectoryUseCase({this.foodDirectoryRepository});

  List<String> call() => foodDirectoryRepository.getFoodDirectoryData();
}
