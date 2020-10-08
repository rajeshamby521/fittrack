import 'package:fittrack/features/food_directory/domain/repository/food_directory_repository.dart';
import 'package:fittrack/features/food_directory/domain/usecase/food_directory_usecase.dart';
import 'package:fittrack/features/food_directory/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDirectoryBloc extends Bloc<FoodDirectoryEvent, FoodDirectoryState> {

  final FoodDirectoryUseCase foodDirectoryUseCase;

  FoodDirectoryBloc({this.foodDirectoryUseCase});

  @override
  FoodDirectoryState get initialState => InitialFoodDirectoryState();

  @override
  Stream<FoodDirectoryState> mapEventToState(FoodDirectoryEvent event) async* {
    if (event is FetchFoodDirectoryDataEvent) {
      yield LoadingBeginHomeState();
      final result = await foodDirectoryUseCase(FoodDirectoryDataParams());
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchFoodDirectoryDataState(data: success),
      );
    }
  }
}
