import 'package:fittrack/features/weight_sheet/data/datamodel/weight_sheet_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeightSheetState {}

class InitialWeightSheetState extends WeightSheetState {}
class LoadingBeginHomeState extends WeightSheetState {}

class LoadingEndHomeState extends WeightSheetState {}

class ErrorState extends WeightSheetState {
  final String message;

  ErrorState(this.message);
}
class GetWeightSheetState extends WeightSheetState {
  WeightSheetModel data;

  GetWeightSheetState({this.data});
}

class GetWeightState extends WeightSheetState {
  double weight;

  GetWeightState({this.weight});
}

class GetDateState extends WeightSheetState {
  DateTime dateTime;

  GetDateState({this.dateTime});
}
