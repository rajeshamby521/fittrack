import 'package:fittrack/features/chart/data/dataSource/chart_datasource.dart';
import 'package:fittrack/features/chart/data/dataSource/chart_datasource_impl.dart';
import 'package:fittrack/features/chart/data/repository/chart_repository_impl.dart';
import 'package:fittrack/features/chart/domain/repository/chart_repository.dart';
import 'package:fittrack/features/chart/domain/usecase/chart_usecase.dart';
import 'package:fittrack/features/chart/presentation/bloc/bloc.dart';
import 'package:fittrack/features/compare/data/dataSource/compare_datasource.dart';
import 'package:fittrack/features/compare/data/dataSource/compare_datasource_impl.dart';
import 'package:fittrack/features/compare/data/repository/compare_repository_impl.dart';
import 'package:fittrack/features/compare/domain/repository/compare_repository.dart';
import 'package:fittrack/features/compare/domain/usecase/compare_usecase.dart';
import 'package:fittrack/features/compare/presentation/bloc/bloc.dart';
import 'package:fittrack/features/current_bmr/data/datasource/current_bmr_datasource.dart';
import 'package:fittrack/features/current_bmr/data/datasource/current_bmr_datasource_impl.dart';
import 'package:fittrack/features/current_bmr/data/repository/current_bmr_repository_impl.dart';
import 'package:fittrack/features/current_bmr/domain/repository/current_bmr_repository.dart';
import 'package:fittrack/features/current_bmr/domain/usecase/current_bmr_usecase.dart';
import 'package:fittrack/features/current_bmr/presentation/bloc/bloc.dart';
import 'package:fittrack/features/dashboard/data/datasource/dashboard_data_source.dart';
import 'package:fittrack/features/dashboard/data/datasource/dashboard_data_source_impl.dart';
import 'package:fittrack/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:fittrack/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:fittrack/features/dashboard/domain/usecases/dashboard_usecase.dart';
import 'package:fittrack/features/dashboard/presentation/bloc/bloc.dart';
import 'package:fittrack/features/drawer/data/datasource/drawer_data_source.dart';
import 'package:fittrack/features/drawer/data/datasource/drawer_data_source_impl.dart';
import 'package:fittrack/features/drawer/data/repository/drawer_repository_impl.dart';
import 'package:fittrack/features/drawer/domain/repository/drawer_repository.dart';
import 'package:fittrack/features/drawer/domain/usecases/drawer_usecase.dart';
import 'package:fittrack/features/drawer/presentation/bloc/bloc.dart';
import 'package:fittrack/features/feedback/data/dataSource/feedback_datasource.dart';
import 'package:fittrack/features/feedback/data/dataSource/feedback_datasource_impl.dart';
import 'package:fittrack/features/feedback/data/repository/feedback_repository_impl.dart';
import 'package:fittrack/features/feedback/domain/repository/feedback_repository.dart';
import 'package:fittrack/features/feedback/domain/usecase/feedback_usecase.dart';
import 'package:fittrack/features/feedback/presentation/bloc/bloc.dart';
import 'package:fittrack/features/food_directory/data/dataSource/food_directory_datasource.dart';
import 'package:fittrack/features/food_directory/data/dataSource/food_directory_datasource_impl.dart';
import 'package:fittrack/features/food_directory/data/repository/food_directory_repository_impl.dart';
import 'package:fittrack/features/food_directory/domain/repository/food_directory_repository.dart';
import 'package:fittrack/features/food_directory/domain/usecase/food_directory_usecase.dart';
import 'package:fittrack/features/food_directory/presentation/bloc/bloc.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_source/rich_food_datasource.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_source/rich_food_datasource_impl.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/repository/rich_food_repository_impl.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/domain/repository/rich_food_repository.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/domain/usecase/rich_food_usecase.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/presentation/bloc/bloc.dart';
import 'package:fittrack/features/food_instructions/data/datasource/food_instruction_datasource.dart';
import 'package:fittrack/features/food_instructions/data/datasource/food_instruction_datasource_impl.dart';
import 'package:fittrack/features/food_instructions/data/repository/food_instruction_repository_impl.dart';
import 'package:fittrack/features/food_instructions/domain/repository/food_instruction_repository.dart';
import 'package:fittrack/features/food_instructions/domain/usecase/food_instruction_usecase.dart';
import 'package:fittrack/features/food_instructions/presentation/bloc/bloc.dart';
import 'package:fittrack/features/home/data/datasource/home_data_source.dart';
import 'package:fittrack/features/home/data/datasource/home_data_source_impl.dart';
import 'package:fittrack/features/home/data/repository/home_repository_impl.dart';
import 'package:fittrack/features/home/domain/repository/home_repository.dart';
import 'package:fittrack/features/home/domain/usecases/home_usecase.dart';
import 'package:fittrack/features/home/presentation/bloc/bloc.dart';
import 'package:fittrack/features/login/data/datasource/login_datasource.dart';
import 'package:fittrack/features/login/data/datasource/login_datasource_impl.dart';
import 'package:fittrack/features/login/data/repository/login_repository_impl.dart';
import 'package:fittrack/features/login/domain/repository/login_repository.dart';
import 'package:fittrack/features/login/domain/usecase/login_usecase.dart';
import 'package:fittrack/features/login/presentation/bloc/bloc.dart';
import 'package:fittrack/features/photo_gallery/data/dataSource/photo_gallery_datasource.dart';
import 'package:fittrack/features/photo_gallery/data/dataSource/photo_gallery_datasource_impl.dart';
import 'package:fittrack/features/photo_gallery/data/repository/photo_gallery_repository_impl.dart';
import 'package:fittrack/features/photo_gallery/domain/repository/photo_gallery_repository.dart';
import 'package:fittrack/features/photo_gallery/domain/usecase/photo_gallery_usecase.dart';
import 'package:fittrack/features/photo_gallery/presentation/bloc/bloc.dart';
import 'package:fittrack/features/signup/data/datasource/signup_datasource.dart';
import 'package:fittrack/features/signup/data/datasource/signup_datasource_impl.dart';
import 'package:fittrack/features/signup/data/repository/signup_repository_impl.dart';
import 'package:fittrack/features/signup/domain/repository/signup_repository.dart';
import 'package:fittrack/features/signup/domain/usecase/signup_usecase.dart';
import 'package:fittrack/features/signup/presentation/bloc/bloc.dart';
import 'package:fittrack/features/weight_sheet/data/datasource/weight_sheet_datasource.dart';
import 'package:fittrack/features/weight_sheet/data/datasource/weight_sheet_datasource_impl.dart';
import 'package:fittrack/features/weight_sheet/data/repository/weight_sheet_repository_impl.dart';
import 'package:fittrack/features/weight_sheet/domain/repository/weight_sheet_repository.dart';
import 'package:fittrack/features/weight_sheet/domain/usecase/weight_sheet_usecase.dart';
import 'package:fittrack/features/weight_sheet/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initGetServiceLocator() async {
  ///DASHBOARD PAGE
  //Bloc
  getIt.registerFactory(() => DashboardBloc(dashboardAnimateUseCase: getIt()));
  //Use case
  getIt.registerFactory(() => DashboardAnimateUseCase(repository: getIt()));
  //DataSource
  getIt.registerLazySingleton<DashboardSource>(() => DashboardSourceImpl());
  //Repository
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(dashboardSource: getIt()),
  );

  ///DRAWER PAGE
  //Bloc
  getIt.registerFactory(() => DrawerBloc(drawerUseCase: getIt()));
  //Use Case
  getIt.registerFactory(() => DrawerUseCase(repository: getIt()));
  //DataSource
  getIt.registerLazySingleton<DrawerDataSource>(() => DrawerDataSouceImpl());
  //Repository
  getIt.registerLazySingleton<DrawerRepository>(
      () => DrawerRepositoryImpl(drawerDataSource: getIt()));

  ///HOME PAGE
  //Bloc
  getIt.registerFactory(() => HomeBloc(homeUseCase: getIt()));
  //Use case
  getIt.registerFactory(() => HomeUseCase(repository: getIt()));
  //DataSource
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeDataSource: getIt()));

  ///LOGIN PAGE
  //Bloc
  getIt.registerFactory(() => LogInBloc(logInButtonStatusUseCase: getIt(), logInUseCase: getIt()));
  //Use case
  getIt.registerFactory(() => LogInButtonStatusUseCase(logInRepository: getIt()));
  getIt.registerFactory(() => LogInUseCase(logInRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<LogInDataSource>(() => LogInDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<LogInRepository>(() => LogInRepositoryImpl(logInDataSource: getIt()));

  ///SIGNUP PAGE
  //Bloc
  getIt.registerFactory(() => SignUpBloc(
        signUpUseCase: getIt(),
        signUpEmailUseCase: getIt(),
        signUpPasswordUseCase: getIt(),
        signUpButtonStatusUseCase: getIt(),
      ));
  //Use case
  getIt.registerFactory(() => SignUpUseCase(signUpRepository: getIt()));
  getIt.registerFactory(() => SignUpEmailUseCase(signUpRepository: getIt()));
  getIt.registerFactory(() => SignUpPasswordUseCase(signUpRepository: getIt()));
  getIt.registerFactory(() => SignUpButtonStatusUseCase(signUpRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<SignUpDataSource>(() => SignUpDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(signUpDataSource: getIt()));

  ///CURRENT BMR PAGE
  //Bloc
  getIt.registerFactory(() => CurrentBMRBloc(
        calculateBMRUseCase: getIt(),
        calculateCaloriesUseCase: getIt(),
        selectGenderUseCase: getIt(),
        selectActivityUseCase: getIt(),
      ));
  //Use case
  getIt.registerFactory(() => CalculateBMRUseCase(currentBMRRepository: getIt()));
  getIt.registerFactory(() => CalculateCaloriesUseCase(currentBMRRepository: getIt()));
  getIt.registerFactory(() => SelectGenderUseCase(currentBMRRepository: getIt()));
  getIt.registerFactory(() => SelectActivityUseCase(currentBMRRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<CurrentBMRDataSource>(() => CurrentBMRDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<CurrentBMRRepository>(
      () => CurrentBMRRepositoryImpl(currentBMRDataSource: getIt()));

  ///WEIGHT SHEET PAGE
  //Bloc
  getIt.registerFactory(() => WeightSheetBloc(
        weightSheetUseCase: getIt(),
        weightUseCase: getIt(),
        dateUseCase: getIt(),
        setWeightSheetUseCase: getIt(),
      ));
  //Use Case
  getIt.registerFactory(() => WeightSheetUseCase(weightSheetRepository: getIt()));
  getIt.registerFactory(() => SetWeightSheetUseCase(weightSheetRepository: getIt()));
  getIt.registerFactory(() => WeightUseCase(weightSheetRepository: getIt()));
  getIt.registerFactory(() => DateUseCase(weightSheetRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<WeightSheetDataSource>(() => WeightSheetDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<WeightSheetRepository>(
      () => WeightSheetRepositoryImpl(weightSheetDataSource: getIt()));

  ///FOOD DIRECTORY PAGE
  //Bloc
  getIt.registerFactory(() => FoodDirectoryBloc(foodDirectoryUseCase: getIt()));
  //Use case
  getIt.registerFactory(() => FoodDirectoryUseCase(foodDirectoryRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<FoodDirectoryDataSource>(() => FoodDirectoryDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<FoodDirectoryRepository>(
      () => FoodDirectoryRepositoryImpl(foodDirectoryDataSource: getIt()));

  ///RICH FOOD PAGE
  //Bloc
  getIt.registerFactory(() => RichFoodBloc(
        richFoodUseCase: getIt(),
        richFoodDetailUseCase: getIt(),
      ));
  //Use case
  getIt.registerFactory(() => RichFoodUseCase(richFoodRepository: getIt()));
  getIt.registerFactory(() => RichFoodDetailUseCase(richFoodRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<RichFoodDataSource>(() => RichFoodDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<RichFoodRepository>(
      () => RichFoodRepositoryImpl(richFoodDataSource: getIt()));

  ///PHOTO GALLERY PAGE
  //Bloc
  getIt.registerFactory(() => PhotoGalleryBloc(
        photoGalleryDataUseCase: getIt(),
        setPhotoGalleryDataUseCase: getIt(),
        weightUseCase: getIt(),
        dateUseCase: getIt(),
        photoUseCase: getIt(),
      ));
  //Use Case
  getIt.registerFactory(() => PhotoGalleryDataUseCase(photoGalleryRepository: getIt()));
  getIt.registerFactory(() => SetPhotoGalleryDataUseCase(photoGalleryRepository: getIt()));
  getIt.registerFactory(() => PhotoGalleryPhotoUseCase(photoGalleryRepository: getIt()));
  getIt.registerFactory(() => PhotoGalleryWeightUseCase(photoGalleryRepository: getIt()));
  getIt.registerFactory(() => PhotoGalleryDateUseCase(photoGalleryRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<PhotoGalleryDataSource>(() => PhotoGalleryDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<PhotoGalleryRepository>(
      () => PhotoGalleryRepositoryImpl(photoGalleryDataSource: getIt()));

  ///COMPARE PAGE
  //Bloc
  getIt.registerFactory(() => CompareBloc(
        getCompareDataUseCase: getIt(),
        setCompareDataUseCase: getIt(),
        weightUseCase: getIt(),
        dateUseCase: getIt(),
        photoUseCase: getIt(),
      ));
  //Use Case
  getIt.registerFactory(() => GetCompareDataUseCase(compareRepository: getIt()));
  getIt.registerFactory(() => SetCompareDataUseCase(compareRepository: getIt()));
  getIt.registerFactory(() => ComparePhotoUseCase(compareRepository: getIt()));
  getIt.registerFactory(() => CompareWeightUseCase(compareRepository: getIt()));
  getIt.registerFactory(() => CompareDateUseCase(compareRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<CompareDataSource>(() => CompareDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<CompareRepository>(
      () => CompareRepositoryImpl(compareDataSource: getIt()));

  ///FOOD INSTRUCTION PAGE
  //Bloc
  getIt.registerFactory(() => FoodInstructionBloc(foodInstructionUseCase: getIt()));
  //Use Case
  getIt.registerFactory(() => FoodInstructionUseCase(foodInstructionRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<FoodInstructionDataSource>(() => FoodInstructionDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<FoodInstructionRepository>(
      () => FoodInstructionRepositoryImpl(foodInstructionDataSource: getIt()));

  ///CHART PAGE
  //Bloc
  getIt.registerFactory(() => ChartBloc(chartDataUseCase: getIt()));
  //Use Case
  getIt.registerFactory(() => ChartDataUseCase(chartRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<ChartDataSource>(() => ChartDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<ChartRepository>(() => ChartRepositoryImpl(chartDataSource: getIt()));

  ///FEEDBACK PAGE
  //Bloc
  getIt.registerFactory(
      () => FeedbackBloc(feedbackDataUseCase: getIt(), feedbackButtonStatusUseCase: getIt()));
  //Use Case
  getIt.registerFactory(() => FeedbackDataUseCase(feedbackRepository: getIt()));
  getIt.registerFactory(() => FeedbackButtonStatusUseCase(feedbackRepository: getIt()));
  //DataSource
  getIt.registerLazySingleton<FeedbackDataSource>(() => FeedbackDataSourceImpl());
  //Repository
  getIt.registerLazySingleton<FeedbackRepository>(
      () => FeedbackRepositoryImpl(feedbackDataSource: getIt()));
}
