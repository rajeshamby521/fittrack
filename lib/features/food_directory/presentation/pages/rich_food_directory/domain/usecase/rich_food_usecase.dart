import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_detail_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/domain/repository/rich_food_repository.dart';
import 'package:fittrack/usecase/usecase.dart';

class RichFoodUseCase extends UseCase<RichFoodDataModel, RichFoodParams> {
  RichFoodRepository richFoodRepository;

  RichFoodUseCase({this.richFoodRepository});

  @override
  Future<Either<Failure, RichFoodDataModel>> call(RichFoodParams params) async {
    return await richFoodRepository.getRichFoodData(
      categoryId: params.categoryId,
      offSet: params.offSet,
    );
  }
}

class RichFoodParams extends Equatable {
  String categoryId;
  String offSet;

  RichFoodParams({this.categoryId, this.offSet}) : super([categoryId, offSet]);
}

class RichFoodDetailUseCase extends UseCase<RichFoodDetailDataModel, RichFoodDetailParams> {
  RichFoodRepository richFoodRepository;

  RichFoodDetailUseCase({this.richFoodRepository});

  @override
  Future<Either<Failure, RichFoodDetailDataModel>> call(RichFoodDetailParams params) async {
    return await richFoodRepository.getRichFoodDetailData(foodId: params.foodId);
  }
}

class RichFoodDetailParams extends Equatable {
  String foodId;

  RichFoodDetailParams({this.foodId}) : super([foodId]);
}
