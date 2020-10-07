
import 'package:fittrack/features/current_bmr/data/datasource/current_bmr_datasource_impl.dart';

abstract class CurrentBMREvent {}

class CalculateBMREvent extends CurrentBMREvent {
  double age;
  double weight;
  double height;
  bool gender;

  CalculateBMREvent({this.age, this.height, this.weight, this.gender}) {
    // CurrentBMRDataSourceImpl.setBMRData(age: age, height: height, weight: weight, gender: gender);
    CurrentBMRDataSourceImpl.setAgeData(age: age);
    CurrentBMRDataSourceImpl.setWeightData(weight: weight);
    CurrentBMRDataSourceImpl.setHeightData(height: height);
    CurrentBMRDataSourceImpl.setGenderData(gender: gender);
  }
}

class CalculateCaloriesEvent extends CurrentBMREvent {
  double bmr;
  String activity;

  CalculateCaloriesEvent({this.bmr, this.activity}) {
    CurrentBMRDataSourceImpl.setCaloriesData(
      bmr: bmr,
      activity: activity,
    );
  }
}

class SelectActivityEvent extends CurrentBMREvent {
  String activity;

  SelectActivityEvent({this.activity}) {
    CurrentBMRDataSourceImpl.setActivityData(activity: activity);
  }
}

class SelectGenderEvent extends CurrentBMREvent {
  bool gender;

  SelectGenderEvent({this.gender}) {
    CurrentBMRDataSourceImpl.setGenderData(gender: gender);
  }
}
