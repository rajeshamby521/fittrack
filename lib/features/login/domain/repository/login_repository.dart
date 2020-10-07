import 'package:dartz/dartz.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/login/data/datamodel/login_model.dart';

abstract class LogInRepository {
  Future<Either<Failure, ErrorStatusModel>> getLogInButtonStatusData({
    bool emailValid,
    bool passwordValid,
    String emailMsg,
    String passMsg,
  });

  Future<Either<Failure, LogInModel>> getLogInData({
    String email,
    String password,
  });
}
