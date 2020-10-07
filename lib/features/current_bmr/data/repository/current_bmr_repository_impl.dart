import 'package:fittrack/features/current_bmr/data/datasource/current_bmr_datasource.dart';
import 'package:fittrack/features/current_bmr/domain/repository/current_bmr_repository.dart';

class CurrentBMRRepositoryImpl extends CurrentBMRRepository {
  CurrentBMRDataSource currentBMRDataSource;

  CurrentBMRRepositoryImpl({this.currentBMRDataSource});

  @override
  double getBMRData() => currentBMRDataSource.getBMRData();

  @override
  double getCaloriesData() => currentBMRDataSource.getCaloriesData();

  @override
  bool selectGenderData() => currentBMRDataSource.selectGenderData();

  @override
  String selectActivityData() => currentBMRDataSource.selectActivityData();
}
