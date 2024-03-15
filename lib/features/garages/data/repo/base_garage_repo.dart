import 'package:dartz/dartz.dart';
import 'package:parking_app/features/garages/data/models/garage_model.dart';

import '../../../../core/errors/failure.dart';

abstract class BaseGarageRepo {
  Future<Either<Failure, List<GarageModel>>> getGarages();
}
