import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';

abstract class DrawerRepository {
  Future<Either<Failure, int>> getData({int pageNo});
}
