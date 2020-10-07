
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/domain/repository/rich_food_repository.dart';

class RichFoodUseCase {
  RichFoodRepository richFoodRepository;

  RichFoodUseCase({this.richFoodRepository});

  List<RichFoodModel> call() => richFoodRepository.getRichFoodData();
}
