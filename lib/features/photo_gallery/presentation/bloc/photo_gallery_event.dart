import 'dart:io';

abstract class PhotoGalleryEvent {}

class GetPhotoGalleryDataEvent extends PhotoGalleryEvent {
  int offSet;
  GetPhotoGalleryDataEvent({this.offSet});
}

// class GetPhotoGalleryDataEvent extends PhotoGalleryEvent {
//   DateTime dateTime;
//   double weight;
//   File image;
//
//   GetPhotoGalleryDataEvent({this.dateTime, this.weight, this.image});
// }

class GetPhotoGalleryPhotoEvent extends PhotoGalleryEvent {
  File image;

  GetPhotoGalleryPhotoEvent({this.image});
}

class GetPhotoGalleryWeightEvent extends PhotoGalleryEvent {
  double weight;

  GetPhotoGalleryWeightEvent({this.weight});
}

class GetPhotoGalleryDateEvent extends PhotoGalleryEvent {
  DateTime dateTime;

  GetPhotoGalleryDateEvent({this.dateTime});
}
