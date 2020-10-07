import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';

abstract class DashboardRepository {
  Future<Either<Failure, bool>> getAnimateData({bool animate});
}
