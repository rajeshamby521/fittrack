
import 'package:equatable/equatable.dart';

abstract class Status extends Equatable {}

class Success extends Status {
  final String message;

  Success(this.message);
}

class Failure extends Status {
  final String message;

  Failure(this.message);
}
