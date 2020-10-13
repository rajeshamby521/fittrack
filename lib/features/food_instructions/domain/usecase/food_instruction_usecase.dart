import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/food_instructions/data/datamodel/food_instruction_datamodel.dart';
import 'package:fittrack/features/food_instructions/domain/repository/food_instruction_repository.dart';
import 'package:fittrack/usecase/usecase.dart';

class FoodInstructionUseCase extends UseCase<FoodInstructionDataModel, FoodInstructionDataParams> {
  FoodInstructionRepository foodInstructionRepository;

  FoodInstructionUseCase({this.foodInstructionRepository});

  @override
  Future<Either<Failure, FoodInstructionDataModel>> call(FoodInstructionDataParams params) async =>
      await foodInstructionRepository.getFoodInstructionData(foodAvoidId: params.foodAvoidId);
}

class FoodInstructionDataParams extends Equatable {
  String foodAvoidId;

  FoodInstructionDataParams({this.foodAvoidId}) : super([foodAvoidId]);
}
