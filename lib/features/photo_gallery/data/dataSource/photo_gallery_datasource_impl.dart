import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fittrack/features/photo_gallery/data/dataModel/photo_gallery_model.dart';
import 'package:fittrack/features/photo_gallery/data/dataSource/photo_gallery_datasource.dart';
import 'package:fittrack/network/api_provider.dart';
import 'package:fittrack/network/api_strings.dart';
import 'package:fittrack/utils/app_preference.dart';

class PhotoGalleryDataSourceImpl extends PhotoGalleryDataSource {
  PhotoGalleryModel data;
  Dio _dio = Dio(options);

  @override
  Future<DateTime> getDate({DateTime dateTime}) async => dateTime;

  @override
  Future<File> getPhoto({File image}) async => image;

  @override
  Future<PhotoGalleryModel> getPhotoGalleryData({int offSet}) async {
    Map<String, dynamic> map = Map();
    map[user_id] = AppPreference.getString(user_id);
    map[access_token] = AppPreference.getString(access_token);
    map[lang] = "0";
    map[offset] = offSet.toString();

    var response = await _dio.post(getPhotoGalleryListURL, data: FormData.fromMap(map));
    data = PhotoGalleryModel.fromMap(response.data);

    // photoGaleeryList.add({
    //   "weight": weight.toString(),
    //   "dateTime": dateTime.toString(),
    //   "image": image,
    // });
    print("*-*-*  $data");
    return data;
  }

  @override
  Future<double> getWeight({double weight}) async => weight;
}

// final _photoGalleryList = {"status": 200, "PhotoGallery list": photoGaleeryList};
//
// dynamic photoGaleeryList = [
//   {"weight": "40", "dateTime": "2020-10-01 10:06:40.285", "image": ""},
//   {"weight": "50", "dateTime": "2020-10-01 10:06:40.285", "image": ""},
//   {"weight": "50", "dateTime": "2020-10-01 10:06:40.285", "image": ""},
// ];
