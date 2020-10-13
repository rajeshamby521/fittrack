import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/domain/usecase/rich_food_usecase.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RichFoodBloc extends Bloc<RichFoodEvent, RichFoodState> {
  @override
  RichFoodState get initialState => InitialRichFoodState();

  RichFoodUseCase richFoodUseCase;
  RichFoodDetailUseCase richFoodDetailUseCase;

  RichFoodBloc({this.richFoodUseCase, this.richFoodDetailUseCase});

  @override
  Stream<RichFoodState> mapEventToState(RichFoodEvent event) async* {
    if (event is FetchRichFoodDataEvent) {
      yield LoadingBeginRichFoodState();
      final result = await richFoodUseCase(RichFoodParams(
        categoryId: event.categoryId,
        offSet: event.offSet,
      ));
      yield LoadingEndRichFoodState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchRichFoodDataState(data: success),
      );
    }
    if (event is FetchRichFoodDetailDataEvent) {
      yield LoadingBeginRichFoodDetailState();
      final result = await richFoodDetailUseCase(RichFoodDetailParams(foodId: event.foodId));
      yield LoadingEndRichFoodDetailState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchRichFoodDetailDataState(data: success),
      );
    }
  }
}
