import 'package:fittrack/features/drawer/data/datasource/drawer_data_source.dart';

class DrawerDataSouceImpl extends DrawerDataSource {
  @override
  Future<int> getData({int pageNo}) async => pageNo;
}
