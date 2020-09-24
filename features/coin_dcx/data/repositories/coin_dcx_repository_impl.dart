import 'package:coin_dcx/core/error/exceptions.dart';
import 'package:coin_dcx/core/network/network_info.dart';
import 'package:coin_dcx/features/coin_dcx/data/datasources/coin_dcx_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/coin_assets.dart';
import '../../domain/repositories/coin_dcx_repository.dart';

class CoinDcxRepositoryImpl implements CoinDcxRepository {
  final CoinDcxRemoteDataSource coinDcxRemoteDataSource;
  final NetworkInfo networkInfo;

  CoinDcxRepositoryImpl(
      {@required this.coinDcxRemoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, List<CoinAssets>>> getCoinDataForAssets() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await coinDcxRemoteDataSource.getCoinDataForAssets());
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
