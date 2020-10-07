
import 'package:fittrack/features/food_directory/domain/repository/food_directory_repository.dart';
import 'package:fittrack/features/food_directory/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDirectoryBloc extends Bloc<FoodDirectoryEvent, FoodDirectoryState> {
  @override
  FoodDirectoryState get initialState => InitialFoodDirectoryState();

  FoodDirectoryRepository foodDirectoryRepository;

  FoodDirectoryBloc({this.foodDirectoryRepository});

  @override
  Stream<FoodDirectoryState> mapEventToState(FoodDirectoryEvent event) async* {
    if (event is FetchFoodDirectoryDataEvent) {
      final result = await foodDirectoryRepository.getFoodDirectoryData();
      yield FetchFoodDirectoryDataState(data: result);
    }
  }
}
