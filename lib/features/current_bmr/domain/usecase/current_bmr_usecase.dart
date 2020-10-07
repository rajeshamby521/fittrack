
import 'package:fittrack/features/current_bmr/domain/repository/current_bmr_repository.dart';

class CalculateBMRUseCase {
  CurrentBMRRepository currentBMRRepository;

  CalculateBMRUseCase({this.currentBMRRepository});

  double call() => currentBMRRepository.getBMRData();
}

class CalculateCaloriesUseCase {
  CurrentBMRRepository currentBMRRepository;

  CalculateCaloriesUseCase({this.currentBMRRepository});

  double call() => currentBMRRepository.getCaloriesData();
}

class SelectGenderUseCase {
  CurrentBMRRepository currentBMRRepository;

  SelectGenderUseCase({this.currentBMRRepository});

  bool call() => currentBMRRepository.selectGenderData();
}

class SelectActivityUseCase {
  CurrentBMRRepository currentBMRRepository;

  SelectActivityUseCase({this.currentBMRRepository});

  String call() => currentBMRRepository.selectActivityData();
}
