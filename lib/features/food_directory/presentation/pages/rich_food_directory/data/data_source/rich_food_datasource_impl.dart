import 'package:dio/dio.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_source/rich_food_datasource.dart';
import 'package:fittrack/network/api_provider.dart';
import 'package:fittrack/network/api_strings.dart';
import 'package:fittrack/utils/app_preference.dart';

class RichFoodDataSourceImpl extends RichFoodDataSource {
  Dio _dio = Dio(options);
  RichFoodDataModel data;

  @override
  Future<RichFoodDataModel> fetchRichFoodData({String categoryId, String offSet}) async {
    Map<String, dynamic> map = Map();
    map[user_id] = AppPreference.getString(user_id);
    map[access_token] = AppPreference.getString(access_token);
    map[lang] = "0";
    map[category_id] = categoryId;
    map[offSet] = offSet;

    var responce = await _dio.post(getFoodDirectoryListURL, data: FormData.fromMap(map));
    data = RichFoodDataModel.fromMap(responce.data);
    print("FoodDirectoryListURL :---  ${responce.data}");
    return data;
  }
}
