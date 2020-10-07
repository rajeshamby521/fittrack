import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/drawer/data/datasource/drawer_data_source.dart';
import 'package:fittrack/features/drawer/domain/repository/drawer_repository.dart';
import 'package:flutter/material.dart';

class DrawerRepositoryImpl extends DrawerRepository {
  DrawerDataSource drawerDataSource;

  DrawerRepositoryImpl({@required this.drawerDataSource});

  @override
  Future<Either<Failure, int>> getData({int pageNo}) async {
    final result = await drawerDataSource.getData(pageNo: pageNo);
    return Right(result);
  }
}
