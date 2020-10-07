import 'package:meta/meta.dart';

@immutable
abstract class FoodDirectoryState {}

class InitialFoodDirectoryState extends FetchFoodDirectoryDataState {}

class LoadingBeginHomeState extends FetchFoodDirectoryDataState {}

class LoadingEndHomeState extends FetchFoodDirectoryDataState {}

class ErrorState extends FetchFoodDirectoryDataState {
  final String message;

  ErrorState(this.message);
}
class FetchFoodDirectoryDataState extends FoodDirectoryState {
  List<String> data;

  FetchFoodDirectoryDataState({this.data});
}
