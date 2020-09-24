import 'package:coin_dcx/core/error/failures.dart';
import 'package:coin_dcx/core/usecases/usecase.dart';
import 'package:coin_dcx/features/coin_dcx/domain/entities/coin_assets.dart';
import 'package:coin_dcx/features/coin_dcx/domain/repositories/coin_dcx_repository.dart';
import 'package:dartz/dartz.dart';

class GetCoinAssetsData implements UseCase<CoinAssets> {
  CoinDcxRepository repository;

  GetCoinAssetsData(this.repository);
  @override
  Future<Either<Failure, List<CoinAssets>>> call() async {
    return await repository.getCoinDataForAssets();
  }
}
