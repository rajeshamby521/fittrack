
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/domain/repository/rich_food_repository.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RichFoodBloc extends Bloc<RichFoodEvent, RichFoodState> {
  @override
  RichFoodState get initialState => InitialRichFoodState();

  RichFoodRepository richFoodRepository;

  RichFoodBloc({this.richFoodRepository});

  @override
  Stream<RichFoodState> mapEventToState(RichFoodEvent event) async* {
    if (event is FetchRichFoodDataEvent) {
      final result = await richFoodRepository.getRichFoodData();
      yield FetchRichFoodDataState(data: result);
    }
  }
}
