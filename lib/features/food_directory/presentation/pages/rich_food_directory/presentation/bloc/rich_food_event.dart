
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_source/rich_food_datasource_impl.dart';

abstract class RichFoodEvent {}

class FetchRichFoodDataEvent extends RichFoodEvent {
  String foodType;

  FetchRichFoodDataEvent({this.foodType}) {
    RichFoodDataSourceImpl.setAgeData(foodType: foodType);
  }
}
