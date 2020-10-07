// To parse this JSON data, do
//
//     final photoGalleryDataModel = photoGalleryDataModelFromMap(jsonString);

import 'dart:convert';

PhotoGalleryDataModel photoGalleryDataModelFromMap(String str) => PhotoGalleryDataModel.fromMap(json.decode(str));

String photoGalleryDataModelToMap(PhotoGalleryDataModel data) => json.encode(data.toMap());

class PhotoGalleryDataModel {
  PhotoGalleryDataModel({
    this.status,
    this.photoGalleryList,
  });

  int status;
  List<PhotoGalleryList> photoGalleryList;

  factory PhotoGalleryDataModel.fromMap(Map<String, dynamic> json) => PhotoGalleryDataModel(
    status: json["status"] == null ? null : json["status"],
    photoGalleryList: json["PhotoGallery list"] == null ? null : List<PhotoGalleryList>.from(json["PhotoGallery list"].map((x) => PhotoGalleryList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "PhotoGallery list": photoGalleryList == null ? null : List<dynamic>.from(photoGalleryList.map((x) => x.toMap())),
  };
}

class PhotoGalleryList {
  PhotoGalleryList({
    this.weight,
    this.dateTime,
    this.image,
  });

  String weight;
  DateTime dateTime;
  String image;

  factory PhotoGalleryList.fromMap(Map<String, dynamic> json) => PhotoGalleryList(
    weight: json["weight"] == null ? null : json["weight"],
    dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toMap() => {
    "weight": weight == null ? null : weight,
    "dateTime": dateTime == null ? null : dateTime.toIso8601String(),
    "image": image == null ? null : image,
  };
}
