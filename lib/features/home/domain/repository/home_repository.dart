
import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<String>>> getData();
}