import 'package:fittrack/features/weight_sheet/domain/usecase/weight_sheet_usecase.dart';
import 'package:fittrack/features/weight_sheet/presentation/bloc/bloc.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightSheetBloc extends Bloc<WeightSheetEvent, WeightSheetState> {
  @override
  WeightSheetState get initialState => InitialWeightSheetState();

  WeightSheetUseCase weightSheetUseCase;
  WeightUseCase weightUseCase;
  DateUseCase dateUseCase;

  WeightSheetBloc({this.weightSheetUseCase, this.weightUseCase, this.dateUseCase});

  @override
  Stream<WeightSheetState> mapEventToState(WeightSheetEvent event) async* {
    if (event is GetWeightSheetEvent) {
      yield LoadingBeginHomeState();
      final result = await weightSheetUseCase(WeightSheetParams(offSet: event.offSet));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetWeightSheetState(data: success),
      );
    }
    if (event is GetWeightEvent) {
      yield LoadingBeginHomeState();
      final result = await weightUseCase(WeightParams(
        weight: event.weight,
      ));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetWeightState(weight: success),
      );
    }
    if (event is GetDateEvent) {
      yield LoadingBeginHomeState();
      final result = await dateUseCase(DateParams(
        dateTime: event.dateTime,
      ));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetDateState(dateTime: success),
      );
    }
  }
}
