import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/compare/data/dataModel/compare_model.dart';

abstract class CompareRepository {
  Future<Either<Failure, CompareDataModel>> getCompareDate({
    File image1,
    File image2,
    double weight1,
    double weight2,
    DateTime dateTime1,
    DateTime dateTime2,
  });

  Future<Either<Failure, WeightModel>> getWeight({double weight, int pic});

  Future<Either<Failure, ImageModel>> getPhoto({File image, int pic});

  Future<Either<Failure, DateModel>> getDate({DateTime dateTime, int pic});
}
