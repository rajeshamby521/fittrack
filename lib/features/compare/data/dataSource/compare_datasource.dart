import 'dart:io';

import 'package:fittrack/features/compare/data/dataModel/compare_model.dart';

abstract class CompareDataSource {
  Future<CompareDataModel> getCompareData({
    File image1,
    File image2,
    double weight1,
    double weight2,
    DateTime dateTime1,
    DateTime dateTime2,
  });

  Future<ImageModel> getPhoto({File image, int pic});

  Future<WeightModel> getWeight({double weight, int pic});

  Future<DateModel> getDate({DateTime dateTime, int pic});
}
