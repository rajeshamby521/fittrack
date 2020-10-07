
import 'package:fittrack/features/current_bmr/domain/usecase/current_bmr_usecase.dart';
import 'package:fittrack/features/current_bmr/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentBMRBloc extends Bloc<CurrentBMREvent, CurrentBMRState> {
  @override
  CurrentBMRState get initialState => InitialCurrentBMRState();

  CalculateBMRUseCase calculateBMRUseCase;
  CalculateCaloriesUseCase calculateCaloriesUseCase;
  SelectGenderUseCase selectGenderUseCase;
  SelectActivityUseCase selectActivityUseCase;

  CurrentBMRBloc({
    this.calculateBMRUseCase,
    this.calculateCaloriesUseCase,
    this.selectGenderUseCase,
    this.selectActivityUseCase,
  });

  @override
  Stream<CurrentBMRState> mapEventToState(CurrentBMREvent event) async* {
    if (event is CalculateBMREvent) {
      final result = await calculateBMRUseCase.call();
      yield CalculateBMRState(bmr: result);
    }
    if (event is CalculateCaloriesEvent) {
      final result = await calculateCaloriesUseCase.call();
      yield CalculateCaloriesState(calories: result);
    }
    if (event is SelectGenderEvent) {
      final result = await selectGenderUseCase.call();
      yield SelectGenderState(gender: result);
    }
    if (event is SelectActivityEvent) {
      final result = await selectActivityUseCase.call();
      yield SelectActivityState(activity: result);
    }
  }
}
