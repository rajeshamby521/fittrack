import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_source/rich_food_datasource.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/domain/repository/rich_food_repository.dart';

class RichFoodRepositoryImpl extends RichFoodRepository {
  RichFoodDataSource richFoodDataSource;

  RichFoodRepositoryImpl({this.richFoodDataSource});

  @override
  Future<Either<Failure, RichFoodDataModel>> getRichFoodData(
      {String categoryId, String offSet}) async {
    final result = await richFoodDataSource.fetchRichFoodData(
      categoryId: categoryId,
      offSet: offSet,
    );
    return Right(result);
  }
}
