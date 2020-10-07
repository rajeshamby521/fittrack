import 'package:fittrack/features/compare/data/dataModel/compare_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CompareState {}

class InitialCompareState extends CompareState {}

class LoadingBeginHomeState extends CompareState {}

class LoadingEndHomeState extends CompareState {}

class ErrorState extends CompareState {
  final String message;

  ErrorState(this.message);
}

class GetCompareDataState extends CompareState {
  CompareDataModel data;

  GetCompareDataState({this.data});
}

class GetComparePhotoState extends CompareState {
  ImageModel imageModel;

  GetComparePhotoState({this.imageModel});
}

class GetCompareWeightState extends CompareState {
  WeightModel weightModel;

  GetCompareWeightState({this.weightModel});
}

class GetCompareDateState extends CompareState {
  DateModel dateTimeModel;

  GetCompareDateState({this.dateTimeModel});
}
