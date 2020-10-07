import 'package:fittrack/features/compare/domain/usecase/compare_usecase.dart';
import 'package:fittrack/features/compare/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompareBloc extends Bloc<CompareEvent, CompareState> {
  @override
  CompareState get initialState => InitialCompareState();

  CompareDataUseCase compareDataUseCase;
  CompareWeightUseCase weightUseCase;
  ComparePhotoUseCase photoUseCase;
  CompareDateUseCase dateUseCase;

  CompareBloc({
    this.compareDataUseCase,
    this.dateUseCase,
    this.photoUseCase,
    this.weightUseCase,
  });

  @override
  Stream<CompareState> mapEventToState(CompareEvent event) async* {
    if (event is GetCompareDataEvent) {
      yield LoadingBeginHomeState();
      final result = await compareDataUseCase(CompareDataParams(
        image1: event.image1,
        image2: event.image2,
        weight1: event.weight1,
        weight2: event.weight2,
        dateTime1: event.dateTime1,
        dateTime2: event.dateTime2,
      ));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetCompareDataState(data: success),
      );
    }
    if (event is GetComparePhotoEvent) {
      yield LoadingBeginHomeState();
      final result = await photoUseCase(CompareImageParams(
        image: event.image,
        pic: event.pic,
      ));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetComparePhotoState(imageModel: success),
      );
    }
    if (event is GetCompareWeightEvent) {
      yield LoadingBeginHomeState();
      final result = await weightUseCase(CompareWeightParams(
        weight: event.weight,
        pic: event.pic,
      ));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetCompareWeightState(weightModel: success),
      );
    }
    if (event is GetCompareDateEvent) {
      yield LoadingBeginHomeState();
      final result = await dateUseCase(CompareDateParams(
        dateTime: event.dateTime,
        pic: event.pic,
      ));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetCompareDateState(dateTimeModel: success),
      );
    }
  }
}
