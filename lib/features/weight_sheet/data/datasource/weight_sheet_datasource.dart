import 'package:fittrack/features/weight_sheet/data/datamodel/weight_sheet_model.dart';

abstract class WeightSheetDataSource {
  Future<WeightSheetModel> getWeightSheetData({int offSet});

  Future<double> getWeight({double weight});

  Future<DateTime> getDate({DateTime dateTime});
}
