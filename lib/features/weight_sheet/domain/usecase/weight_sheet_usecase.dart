import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/weight_sheet/data/datamodel/set_weight_data_model.dart';
import 'package:fittrack/features/weight_sheet/data/datamodel/weight_sheet_model.dart';
import 'package:fittrack/features/weight_sheet/domain/repository/weight_sheet_repository.dart';
import 'package:fittrack/usecase/usecase.dart';

class WeightSheetUseCase extends UseCase<WeightSheetModel, WeightSheetParams> {
  WeightSheetRepository weightSheetRepository;

  WeightSheetUseCase({this.weightSheetRepository});

  @override
  Future<Either<Failure, WeightSheetModel>> call(WeightSheetParams params) async {
    return await weightSheetRepository.getWeightSheetData(offSet: params.offSet);
  }
}

class SetWeightSheetUseCase extends UseCase<SetWeightDataModel, SetWeightSheetParams> {
  WeightSheetRepository weightSheetRepository;

  SetWeightSheetUseCase({this.weightSheetRepository});

  @override
  Future<Either<Failure, SetWeightDataModel>> call(SetWeightSheetParams params) async {
    return await weightSheetRepository.setWeightSheetData(date: params.date, weight: params.weight);
  }
}

class WeightUseCase extends UseCase<double, WeightParams> {
  WeightSheetRepository weightSheetRepository;

  WeightUseCase({this.weightSheetRepository});

  @override
  Future<Either<Failure, double>> call(WeightParams params) async {
    return await weightSheetRepository.getWeight(weight: params.weight);
  }
}

class DateUseCase extends UseCase<DateTime, DateParams> {
  WeightSheetRepository weightSheetRepository;

  DateUseCase({this.weightSheetRepository});

  @override
  Future<Either<Failure, DateTime>> call(DateParams params) async {
    return await weightSheetRepository.getDate(dateTime: params.dateTime);
  }
}

class WeightSheetParams extends Equatable {
  int offSet;

  WeightSheetParams({this.offSet}) : super([offSet]);
}

class SetWeightSheetParams extends Equatable {
  String date;
  String weight;

  SetWeightSheetParams({this.date, this.weight}) : super([date, weight]);
}

class WeightParams extends Equatable {
  double weight;

  WeightParams({this.weight}) : super([weight]);
}

class DateParams extends Equatable {
  DateTime dateTime;

  DateParams({this.dateTime}) : super([dateTime]);
}
