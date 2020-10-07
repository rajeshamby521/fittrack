import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/dashboard/data/datasource/dashboard_data_source.dart';
import 'package:fittrack/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  DashboardSource dashboardSource;

  DashboardRepositoryImpl({this.dashboardSource});

  @override
  Future<Either<Failure, bool>> getAnimateData({bool animate}) async {
    final result = await dashboardSource.getAnimateData(animate: animate);
    return Right(result);
  }
}
