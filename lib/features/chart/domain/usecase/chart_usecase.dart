import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/chart/data/dataModel/chart_model.dart';
import 'package:fittrack/features/chart/domain/repository/chart_repository.dart';
import 'package:fittrack/usecase/usecase.dart';

class ChartDataUseCase extends UseCase<ChartModel, ChartDataParams> {
  ChartRepository chartRepository;

  ChartDataUseCase({this.chartRepository});

  @override
  Future<Either<Failure, ChartModel>> call(ChartDataParams params) async =>
      chartRepository.getChartData(dateType: params.dateType, month: params.month);
}

class ChartDataParams extends Equatable {
  final String dateType;
  final String month;

  ChartDataParams({this.month, this.dateType}) : super([dateType, month]);
}
