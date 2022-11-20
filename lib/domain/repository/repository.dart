import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../models/models.dart';

abstract class Repository {
  Future<Either<Failure, List<Movie>>> getTop250Movie();
}
