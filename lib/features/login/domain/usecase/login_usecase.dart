import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fittrack/constants/status_objects.dart';
import 'package:fittrack/features/login/data/datamodel/login_model.dart';
import 'package:fittrack/features/login/domain/repository/login_repository.dart';
import 'package:fittrack/usecase/usecase.dart';

class LogInButtonStatusUseCase extends UseCase<ErrorStatusModel, LogInButtonStatusParams> {
  LogInRepository logInRepository;

  LogInButtonStatusUseCase({this.logInRepository});

  @override
  Future<Either<Failure, ErrorStatusModel>> call(LogInButtonStatusParams params) async {
    return await logInRepository.getLogInButtonStatusData(
      emailValid: params.emailValid,
      passwordValid: params.passwordValid,
      emailMsg: params.emailMsg,
      passMsg: params.passMsg,
    );
  }
}

class LogInButtonStatusParams extends Equatable {
  bool emailValid;
  bool passwordValid;
  String emailMsg;
  String passMsg;

  LogInButtonStatusParams({this.emailValid, this.passwordValid, this.emailMsg, this.passMsg})
      : super([emailValid, passwordValid, emailMsg, passMsg]);
}

class LogInUseCase extends UseCase<LogInModel, LogInParams> {
  LogInRepository logInRepository;

  LogInUseCase({this.logInRepository});

  @override
  Future<Either<Failure, LogInModel>> call(LogInParams params) async {
    return await logInRepository.getLogInData(
      email: params.email,
      password: params.password,
    );
  }
}

class LogInParams extends Equatable {
  String email;
  String password;

  LogInParams({this.email, this.password}) : super([email, password]);
}
