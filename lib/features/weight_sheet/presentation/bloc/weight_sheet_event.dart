
import 'package:fittrack/features/weight_sheet/data/datamodel/weight_sheet_model.dart';
import 'package:fittrack/features/weight_sheet/data/datasource/weight_sheet_datasource_impl.dart';

abstract class WeightSheetEvent {}

class GetWeightSheetEvent extends WeightSheetEvent {
  int offSet;
  GetWeightSheetEvent({this.offSet});
}
// class GetWeightSheetEvent extends WeightSheetEvent {
//   DateTime dateTime;
//   double weight;
//
//   GetWeightSheetEvent({this.dateTime, this.weight});
// }

class GetWeightEvent extends WeightSheetEvent {
  double weight;

  GetWeightEvent({this.weight});
}

class GetDateEvent extends WeightSheetEvent {
  DateTime dateTime;

  GetDateEvent({this.dateTime});
}
