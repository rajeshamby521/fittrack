import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/compare/data/dataModel/compare_model.dart';
import 'package:fittrack/features/compare/data/dataSource/compare_datasource.dart';
import 'package:fittrack/features/compare/domain/repository/compare_repository.dart';

class CompareRepositoryImpl extends CompareRepository {
  CompareDataSource compareDataSource;

  CompareRepositoryImpl({this.compareDataSource});

  @override
  Future<Either<Failure, CompareDataModel>> getCompareDate({
    File image1,
    File image2,
    double weight1,
    double weight2,
    DateTime dateTime1,
    DateTime dateTime2,
  }) async {
    final result = await compareDataSource.getCompareData(
      dateTime1: dateTime1,
      dateTime2: dateTime2,
      weight1: weight1,
      weight2: weight2,
      image1: image1,
      image2: image2,
    );
    return Right(result);
  }


  @override
  Future<Either<Failure, DateModel>> getDate({DateTime dateTime, int pic}) async {
    final result = await compareDataSource.getDate(dateTime: dateTime, pic: pic);
    return Right(result);
  }

  @override
  Future<Either<Failure, ImageModel>> getPhoto({File image, int pic}) async {
    final result = await compareDataSource.getPhoto(image: image, pic: pic);
    return Right(result);
  }

  @override
  Future<Either<Failure, WeightModel>> getWeight({double weight, int pic}) async {
    final result = await compareDataSource.getWeight(weight: weight, pic: pic);
    return Right(result);
  }
}
