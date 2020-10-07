import 'package:fittrack/features/current_bmr/data/datasource/current_bmr_datasource.dart';
import 'package:fittrack/ui_helper/strings.dart';

class CurrentBMRDataSourceImpl extends CurrentBMRDataSource {
  static double _userAge;
  static double _userWeight;
  static double _userHeight;
  static bool _userGender;
  static double _userBMR;
  static String _userActivity;

  // static setBMRData({double age = 0, double weight = 0, double height = 0, String gender}) {
  //   _userAge = age;
  //   _userHeight = height;
  //   _userWeight = weight;
  //   _userGender = gender;
  // }

  static setCaloriesData({double bmr = 0, String activity}) {
    _userBMR = bmr;
    _userActivity = activity;
  }

  static setActivityData({String activity}) {
    _userActivity = activity;
  }

  static setAgeData({double age = 10}) {
    _userAge = age;
  }

  static setWeightData({double weight = 10}) {
    _userWeight = weight;
  }

  static setHeightData({double height = 50}) {
    _userHeight = height;
  }

  static setGenderData({bool gender = false}) {
    _userGender = gender;
  }

  @override
  double getBMRData() => !_userGender
      ? (88.362 + (13.397 * _userWeight) + (4.799 * _userHeight) - (5.677 * _userAge))
      : (447.593 + (9.247 * _userWeight) + (3.098 * _userHeight) - (4.330 * _userAge));

  @override
  double getCaloriesData() {
    switch (_userActivity) {
      case normal:
        return 1.2 * _userBMR;
        break;
      case light:
        return 1.375 * _userBMR;
        break;
      case medium:
        return 1.55 * _userBMR;
        break;
      case active:
        return 1.725 * _userBMR;
        break;
      default:
        return 0;
        break;
    }
  }

  @override
  bool selectGenderData() => _userGender;

  @override
  String selectActivityData() => _userActivity;
}
