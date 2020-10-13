import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/chart/data/dataModel/chart_model.dart';

abstract class ChartRepository {
  Future<Either<Failure, ChartModel>> getChartData({String dateType, String month});
}
