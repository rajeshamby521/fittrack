import 'dart:io';

import 'package:fittrack/features/photo_gallery/data/dataModel/photo_gallery_model.dart';
import 'package:fittrack/features/photo_gallery/data/dataSource/photo_gallery_datasource.dart';

class PhotoGalleryDataSourceImpl extends PhotoGalleryDataSource {
  PhotoGalleryDataModel list;

  @override
  Future<DateTime> getDate({DateTime dateTime}) async => dateTime;

  @override
  Future<File> getPhoto({File image}) async => image;

  @override
  Future<PhotoGalleryDataModel> getPhotoGalleryData(
      {File image, double weight, DateTime dateTime}) async {
    photoGaleeryList.add({
      "weight": weight.toString(),
      "dateTime": dateTime.toString(),
      "image": image,
    });
    list = PhotoGalleryDataModel.fromMap(_photoGalleryList);
    return list;
  }

  @override
  Future<double> getWeight({double weight}) async => weight;
}

final _photoGalleryList = {"status": 200, "PhotoGallery list": photoGaleeryList};

dynamic photoGaleeryList = [
  {"weight": "40", "dateTime": "2020-10-01 10:06:40.285", "image": ""},
  {"weight": "50", "dateTime": "2020-10-01 10:06:40.285", "image": ""},
  {"weight": "50", "dateTime": "2020-10-01 10:06:40.285", "image": ""},
];
