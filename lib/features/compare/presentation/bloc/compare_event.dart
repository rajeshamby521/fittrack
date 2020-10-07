import 'dart:io';

abstract class CompareEvent {}

class GetCompareDataEvent extends CompareEvent {
  DateTime dateTime1;
  DateTime dateTime2;
  double weight1;
  double weight2;
  File image1;
  File image2;

  GetCompareDataEvent({
    this.dateTime1,
    this.dateTime2,
    this.weight1,
    this.weight2,
    this.image1,
    this.image2,
  });
}

class GetComparePhotoEvent extends CompareEvent {
  File image;
  int pic;

  GetComparePhotoEvent({this.image, this.pic});
}

class GetCompareWeightEvent extends CompareEvent {
  double weight;
  int pic;

  GetCompareWeightEvent({this.weight, this.pic});
}

class GetCompareDateEvent extends CompareEvent {
  DateTime dateTime;
  int pic;

  GetCompareDateEvent({this.dateTime, this.pic});
}
