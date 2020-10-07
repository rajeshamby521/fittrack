
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:meta/meta.dart';

abstract class RichFoodState {}

@immutable
class InitialRichFoodState extends FetchRichFoodDataState {}

class FetchRichFoodDataState extends RichFoodState {
  List<RichFoodModel> data;

  FetchRichFoodDataState({this.data});
}
