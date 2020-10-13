import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/chart/data/dataModel/chart_model.dart';
import 'package:fittrack/features/chart/data/dataSource/chart_datasource.dart';
import 'package:fittrack/features/chart/domain/repository/chart_repository.dart';

class ChartRepositoryImpl extends ChartRepository {
  ChartDataSource chartDataSource;

  ChartRepositoryImpl({this.chartDataSource});

  @override
  Future<Either<Failure, ChartModel>> getChartData({String dateType, String month}) async {
    final result = await chartDataSource.getChartData(dateType: dateType, month: month);
    return Right(result);
  }
}
