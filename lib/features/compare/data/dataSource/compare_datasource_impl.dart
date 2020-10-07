import 'dart:io';

import 'package:fittrack/features/compare/data/dataModel/compare_model.dart';
import 'package:fittrack/features/compare/data/dataSource/compare_datasource.dart';

class CompareDataSourceImpl extends CompareDataSource {
  CompareDataModel list;

  @override
  Future<CompareDataModel> getCompareData({
    File image1,
    File image2,
    double weight1,
    double weight2,
    DateTime dateTime1,
    DateTime dateTime2,
  }) async {
    // compareList.add({
    //   "image1": image1.toString(),
    //   "image2": image2.toString(),
    //   "weight1": weight1.toString(),
    //   "weight2": weight2.toString(),
    //   "dateTime1": dateTime1.toString(),
    //   "dateTime2": dateTime2.toString(),
    // });
    list = CompareDataModel.fromMap(_compareList);
    return list;
  }

  @override
  Future<DateModel> getDate({DateTime dateTime, int pic}) async =>
      DateModel(dateTime: dateTime, pic: pic);

  @override
  Future<ImageModel> getPhoto({File image, int pic}) async => ImageModel(image: image, pic: pic);

  @override
  Future<WeightModel> getWeight({double weight, int pic}) async =>
      WeightModel(weight: weight, pic: pic);
}

final _compareList = {"status": 200, "Compare list": compareList};
dynamic compareList = [
  {
    "weight1": "40",
    "dateTime1": "2020-10-01 10:06:40.285",
    "image1": "",
    "weight2": "40",
    "dateTime2": "2020-10-01 10:06:40.285",
    "image2": ""
  },
  {
    "weight1": "40",
    "dateTime1": "2020-10-01 10:06:40.285",
    "image1": "",
    "weight2": "40",
    "dateTime2": "2020-10-01 10:06:40.285",
    "image2": ""
  },
  {
    "weight1": "40",
    "dateTime1": "2020-10-01 10:06:40.285",
    "image1": "",
    "weight2": "40",
    "dateTime2": "2020-10-01 10:06:40.285",
    "image2": ""
  },
];
