import 'dart:io';

import 'package:fittrack/features/photo_gallery/data/dataModel/photo_gallery_model.dart';
import 'package:fittrack/features/photo_gallery/data/dataModel/set_photo_gallery_data_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PhotoGalleryState {}

class InitialPhotoGalleryState extends PhotoGalleryState {}

class LoadingBeginHomeState extends PhotoGalleryState {}

class LoadingEndHomeState extends PhotoGalleryState {}

class LoadingBeginNextPageState extends PhotoGalleryState {}

class LoadingEndNextPageState extends PhotoGalleryState {}

class ErrorState extends PhotoGalleryState {
  final String message;

  ErrorState(this.message);
}

class GetPhotoGalleryDataState extends PhotoGalleryState {
  PhotoGalleryModel data;

  GetPhotoGalleryDataState({this.data});
}

class SetPhotoGalleryDataState extends PhotoGalleryState {
  SetPhotoGalleryDataModel data;

  SetPhotoGalleryDataState({this.data});
}

class GetPhotoGalleryNextPageDataState extends PhotoGalleryState {
  PhotoGalleryModel data;

  GetPhotoGalleryNextPageDataState({this.data});
}

class GetPhotoGalleryPhotoState extends PhotoGalleryState {
  File image;

  GetPhotoGalleryPhotoState({this.image});
}

class GetPhotoGalleryWeightState extends PhotoGalleryState {
  double weight;

  GetPhotoGalleryWeightState({this.weight});
}

class GetPhotoGalleryDateState extends PhotoGalleryState {
  DateTime dateTime;

  GetPhotoGalleryDateState({this.dateTime});
}
