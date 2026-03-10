import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/core/networking/api_services.dart';
import 'package:task/core/networking/dio_factory.dart';
import 'package:task/features/auth/data/repo/auth_repo.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register your dependencies here
  // Example:
  // getIt.registerLazySingleton<YourService>(() => YourServiceImpl());
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));

}
