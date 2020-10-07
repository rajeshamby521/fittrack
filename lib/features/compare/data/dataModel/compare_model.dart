// To parse this JSON data, do
//
//     final compareDataModel = compareDataModelFromMap(jsonString);

import 'dart:convert';

import 'dart:io';

CompareDataModel compareDataModelFromMap(String str) => CompareDataModel.fromMap(json.decode(str));

String compareDataModelToMap(CompareDataModel data) => json.encode(data.toMap());

class CompareDataModel {
  CompareDataModel({
    this.status,
    this.compareList,
  });

  int status;
  List<CompareList> compareList;

  factory CompareDataModel.fromMap(Map<String, dynamic> json) => CompareDataModel(
        status: json["status"] == null ? null : json["status"],
        compareList: json["Compare list"] == null
            ? null
            : List<CompareList>.from(json["Compare list"].map((x) => CompareList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "Compare list":
            compareList == null ? null : List<dynamic>.from(compareList.map((x) => x.toMap())),
      };
}

class CompareList {
  CompareList({
    this.weight1,
    this.dateTime1,
    this.image1,
    this.weight2,
    this.dateTime2,
    this.image2,
  });

  String weight1;
  DateTime dateTime1;
  String image1;
  String weight2;
  DateTime dateTime2;
  String image2;

  factory CompareList.fromMap(Map<String, dynamic> json) => CompareList(
        weight1: json["weight1"] == null ? null : json["weight1"],
        dateTime1: json["dateTime1"] == null ? null : DateTime.parse(json["dateTime1"]),
        image1: json["image1"] == null ? null : json["image1"],
        weight2: json["weight2"] == null ? null : json["weight2"],
        dateTime2: json["dateTime2"] == null ? null : DateTime.parse(json["dateTime2"]),
        image2: json["image2"] == null ? null : json["image2"],
      );

  Map<String, dynamic> toMap() => {
        "weight1": weight1 == null ? null : weight1,
        "dateTime1": dateTime1 == null ? null : dateTime1.toIso8601String(),
        "image1": image1 == null ? null : image1,
        "weight2": weight2 == null ? null : weight2,
        "dateTime2": dateTime2 == null ? null : dateTime2.toIso8601String(),
        "image2": image2 == null ? null : image2,
      };
}

class DateModel {
  DateTime dateTime;
  int pic;

  DateModel({this.dateTime, this.pic});
}

class WeightModel {
  double weight;
  int pic;

  WeightModel({this.weight, this.pic});
}

class ImageModel {
  File image;
  int pic;

  ImageModel({this.image, this.pic});
}
