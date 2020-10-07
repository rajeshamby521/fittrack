import 'dart:convert';
import 'package:dio/dio.dart';

String baseURL = "http://dignizant.com/fittrack/api/";

BaseOptions options = BaseOptions(
  baseUrl: baseURL,
  headers: <String, String>{
    'authorization': 'Basic ' + base64Encode(utf8.encode("fittrack:jd3Z=fn[\"2#^su\$Y"))
  },
);

const String getJSONLoginURL = "user/login/";
const String getWeightSheetListURL = "weight/weight_list/";
