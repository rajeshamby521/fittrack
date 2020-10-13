import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/food_instructions/data/datamodel/food_instruction_datamodel.dart';

abstract class FoodInstructionRepository {
  Future<Either<Failure, FoodInstructionDataModel>> getFoodInstructionData({String foodAvoidId});
}
