import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/weight_sheet/data/datamodel/weight_sheet_model.dart';

abstract class WeightSheetRepository {
  Future<Either<Failure, WeightSheetModel>> getWeightSheetData({int offSet});

  Future<Either<Failure, double>> getWeight({double weight});

  Future<Either<Failure, DateTime>> getDate({DateTime dateTime});
}
