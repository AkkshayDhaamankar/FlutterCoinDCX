import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/coin_assets.dart';

abstract class CoinDcxRepository {
  Future<Either<Failure, List<CoinAssets>>> getCoinDataForAssets();
}
