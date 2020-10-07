import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/compare/data/dataModel/compare_model.dart';
import 'package:fittrack/features/compare/domain/repository/compare_repository.dart';
import 'package:fittrack/usecase/usecase.dart';

class CompareDataUseCase extends UseCase<CompareDataModel, CompareDataParams> {
  CompareRepository compareRepository;

  CompareDataUseCase({this.compareRepository});

  @override
  Future<Either<Failure, CompareDataModel>> call(CompareDataParams params) async =>
      compareRepository.getCompareDate(
        image1: params.image1,
        image2: params.image2,
        weight1: params.weight1,
        weight2: params.weight2,
        dateTime1: params.dateTime1,
        dateTime2: params.dateTime2,
      );
}

class ComparePhotoUseCase extends UseCase<ImageModel, CompareImageParams> {
  CompareRepository compareRepository;

  ComparePhotoUseCase({this.compareRepository});

  @override
  Future<Either<Failure, ImageModel>> call(CompareImageParams params) async =>
      compareRepository.getPhoto(image: params.image, pic: params.pic);
}

class CompareWeightUseCase extends UseCase<WeightModel, CompareWeightParams> {
  CompareRepository compareRepository;

  CompareWeightUseCase({this.compareRepository});

  @override
  Future<Either<Failure, WeightModel>> call(CompareWeightParams params) async =>
      compareRepository.getWeight(weight: params.weight, pic: params.pic);
}

class CompareDateUseCase extends UseCase<DateModel, CompareDateParams> {
  CompareRepository compareRepository;

  CompareDateUseCase({this.compareRepository});

  @override
  Future<Either<Failure, DateModel>> call(CompareDateParams params) async =>
      compareRepository.getDate(dateTime: params.dateTime, pic: params.pic);
}

class CompareDateParams extends Equatable {
  DateTime dateTime;
  int pic;

  CompareDateParams({this.dateTime, this.pic});
}

class CompareDataParams extends Equatable {
  File image1;
  File image2;
  double weight1;
  double weight2;
  DateTime dateTime1;
  DateTime dateTime2;

  CompareDataParams({
    this.image1,
    this.image2,
    this.weight1,
    this.weight2,
    this.dateTime1,
    this.dateTime2,
  });
}

class CompareWeightParams extends Equatable {
  double weight;
  int pic;

  CompareWeightParams({this.weight, this.pic});
}

class CompareImageParams extends Equatable {
  File image;
  int pic;

  CompareImageParams({this.image, this.pic});
}
