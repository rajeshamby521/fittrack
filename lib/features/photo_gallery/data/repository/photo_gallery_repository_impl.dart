import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/photo_gallery/data/dataModel/photo_gallery_model.dart';
import 'package:fittrack/features/photo_gallery/data/dataSource/photo_gallery_datasource.dart';
import 'package:fittrack/features/photo_gallery/domain/repository/photo_gallery_repository.dart';

class PhotoGalleryRepositoryImpl extends PhotoGalleryRepository {
  PhotoGalleryDataSource photoGalleryDataSource;

  PhotoGalleryRepositoryImpl({this.photoGalleryDataSource});

  @override
  Future<Either<Failure, DateTime>> getDate({DateTime dateTime}) async {
    final result = await photoGalleryDataSource.getDate(dateTime: dateTime);
    return Right(result);
  }

  @override
  Future<Either<Failure, File>> getPhoto({File image}) async {
    final result = await photoGalleryDataSource.getPhoto(image: image);
    return Right(result);
  }

  @override
  Future<Either<Failure, double>> getWeight({double weight}) async {
    final result = await photoGalleryDataSource.getWeight(weight: weight);
    return Right(result);
  }

  @override
  Future<Either<Failure, PhotoGalleryDataModel>> getPhotoGalleryDate({
    double weight,
    File image,
    DateTime dateTime,
  }) async {
    final result = await photoGalleryDataSource.getPhotoGalleryData(
      weight: weight,
      image: image,
      dateTime: dateTime,
    );
    return Right(result);
  }
}
