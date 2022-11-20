import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imdb/data/repository/repository_impl.dart';
import 'package:imdb/domain/repository/repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../domain/usecases/get_top_250_usecase.dart';

var instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  final Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<ImdbServiceClient>(() => ImdbServiceClient(dio));
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(instance<ImdbServiceClient>()));
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance<NetworkInfo>(), instance<RemoteDataSource>()));
  instance.registerLazySingleton<GetTop250MovieUseCase>(() => GetTop250MovieUseCase(instance<Repository>()));
}
