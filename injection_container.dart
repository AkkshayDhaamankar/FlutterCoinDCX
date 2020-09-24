import 'package:coin_dcx/core/network/network_info.dart';
import 'package:coin_dcx/features/coin_dcx/data/repositories/coin_dcx_repository_impl.dart';
import 'package:coin_dcx/features/coin_dcx/domain/usecases/get_coin_assets_data.dart';
import 'package:coin_dcx/features/coin_dcx/presentation/bloc/coin_asset_and_icons_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/coin_dcx/data/datasources/coin_dcx_remote_data_source.dart';
import 'features/coin_dcx/domain/repositories/coin_dcx_repository.dart';
import 'package:http/http.dart' as http;
import 'package:data_connection_checker/data_connection_checker.dart';

final serviceLocator = GetIt.instance;

void init() {
  //! Features - Coin Assets and Its Icons (Repositories, use cases, data sources)

  /*
    * * RegisterFactory Method always creates new instance whenever its called.
    * * Here Bloc which is presentation logic component must be registered as 
    * * Factory because if we navigate to some other screen then we need to 
    * * dispose the observers, or clean memory to prevent strong reference to 
    * * the instances. 
   */
  //? Bloc
  serviceLocator.registerFactory(() => CoinAssetAndIconsBloc(
        getCoinAssetsData: serviceLocator(),
      ));

  /**
   * * SingleTon or LazySingleTon will provide the same instance for the 
   * * subsequent calls
   */
  //? Use cases
  //? Use cases does not hold any state i.e. changing information
  //? So only a single instance is enough. LazySingleTon is registered when
  //? its required and Only Singleton is registered when the app is started.
  serviceLocator
      .registerLazySingleton(() => GetCoinAssetsData(serviceLocator()));

  //? Repository
  serviceLocator.registerLazySingleton<CoinDcxRepository>(() =>
      CoinDcxRepositoryImpl(
          coinDcxRemoteDataSource: serviceLocator(),
          networkInfo: serviceLocator()));

  //? Data Sources
  serviceLocator.registerLazySingleton<CoinDcxRemoteDataSource>(
      () => CoinDcxRemoteDataSourceImpl(client: serviceLocator()));

  //! Core - network info etc
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(serviceLocator()));

  //! External -  HTTP, DataConnection Checker, etc
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => DataConnectionChecker());
}
