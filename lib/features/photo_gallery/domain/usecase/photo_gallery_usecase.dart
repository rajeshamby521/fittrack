import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/photo_gallery/data/dataModel/photo_gallery_model.dart';
import 'package:fittrack/features/photo_gallery/domain/repository/photo_gallery_repository.dart';
import 'package:fittrack/usecase/usecase.dart';

class PhotoGalleryDataUseCase extends UseCase<PhotoGalleryDataModel, PhotoGalleryDataParams> {
  PhotoGalleryRepository photoGalleryRepository;

  PhotoGalleryDataUseCase({this.photoGalleryRepository});

  @override
  Future<Either<Failure, PhotoGalleryDataModel>> call(PhotoGalleryDataParams params) async =>
      photoGalleryRepository.getPhotoGalleryDate(
        image: params.image,
        weight: params.weight,
        dateTime: params.dateTime,
      );
}

class PhotoGalleryDataParams extends Equatable {
  File image;
  double weight;
  DateTime dateTime;

  PhotoGalleryDataParams({
    this.dateTime,
    this.image,
    this.weight,
  }) : super(
          [weight, dateTime, image],
        );
}

class PhotoGalleryPhotoUseCase extends UseCase<File, PhotoGalleryPhotoParams> {
  PhotoGalleryRepository photoGalleryRepository;

  PhotoGalleryPhotoUseCase({this.photoGalleryRepository});

  @override
  Future<Either<Failure, File>> call(PhotoGalleryPhotoParams params) async =>
      photoGalleryRepository.getPhoto(image: params.image);
}

class PhotoGalleryPhotoParams extends Equatable {
  File image;

  PhotoGalleryPhotoParams({this.image}) : super([image]);
}

class PhotoGalleryWeightUseCase extends UseCase<double, PhotoGalleryWeightParams> {
  PhotoGalleryRepository photoGalleryRepository;

  PhotoGalleryWeightUseCase({this.photoGalleryRepository});

  @override
  Future<Either<Failure, double>> call(PhotoGalleryWeightParams params) async =>
      photoGalleryRepository.getWeight(weight: params.weight);
}

class PhotoGalleryWeightParams extends Equatable {
  double weight;

  PhotoGalleryWeightParams({this.weight}) : super([weight]);
}

class PhotoGalleryDateUseCase extends UseCase<DateTime, PhotoGalleryDateParams> {
  PhotoGalleryRepository photoGalleryRepository;

  PhotoGalleryDateUseCase({this.photoGalleryRepository});

  @override
  Future<Either<Failure, DateTime>> call(PhotoGalleryDateParams params) async =>
      photoGalleryRepository.getDate(dateTime: params.dateTime);
}

class PhotoGalleryDateParams extends Equatable {
  DateTime dateTime;

  PhotoGalleryDateParams({this.dateTime}) : super([dateTime]);
}
