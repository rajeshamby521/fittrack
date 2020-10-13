import 'dart:io';

import 'package:fittrack/features/photo_gallery/data/dataModel/photo_gallery_model.dart';
import 'package:fittrack/features/photo_gallery/data/dataModel/set_photo_gallery_data_model.dart';

abstract class PhotoGalleryDataSource {
  Future<PhotoGalleryModel> getPhotoGalleryData({int offSet});

  Future<SetPhotoGalleryDataModel> setPhotoGalleryData({File image, String date, String weight});

  Future<File> getPhoto({File image});

  Future<double> getWeight({double weight});

  Future<DateTime> getDate({DateTime dateTime});
}
