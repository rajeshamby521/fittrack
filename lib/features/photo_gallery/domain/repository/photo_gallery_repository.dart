import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/photo_gallery/data/dataModel/photo_gallery_model.dart';

abstract class PhotoGalleryRepository {
  Future<Either<Failure, PhotoGalleryDataModel>> getPhotoGalleryDate({
    double weight,
    File image,
    DateTime dateTime,
  });

  Future<Either<Failure, double>> getWeight({double weight});

  Future<Either<Failure, File>> getPhoto({File image});

  Future<Either<Failure, DateTime>> getDate({DateTime dateTime});
}
