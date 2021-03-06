import 'dart:convert';
import 'package:dio/dio.dart';

String baseURL = "http://dignizant.com/fittrack/api/";

BaseOptions options = BaseOptions(
  baseUrl: baseURL,
  headers: <String, String>{
    'authorization': 'Basic ' + base64Encode(utf8.encode("fittrack:jd3Z=fn[\"2#^su\$Y"))
  },
);
// jd3Z=fn["2#^su$Y

const String getJSONLoginURL = "user/login/";

const String getWeightSheetListURL = "weight/weight_list/";
const String setWeightSheetDataURL = "weight/save_weight/";

const String getPhotoGalleryListURL = "photo/user_photo_list/";
const String setPhotoGalleryDataURL = "photo/save_photo/";

const String getFoodCategoryListURL = "food/category_list/";
const String getFoodDirectoryListURL = "food/food_directory_list/";
const String getFoodDetailURL = "food/food_directory_details/";

const String getFoodInstructionURL = "food/food_avoids/";

const String getComparePhotoListURL = "photo/user_compare_photo_list/";
const String SetComparePhotoDataURL = "photo/save_compare_photo/";

const String ChartDataURL = "chart/user_weight_chart/";

const String GiveFeedBackURL = "user/save_feedback/";
