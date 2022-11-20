import 'package:imdb/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:imdb/domain/models/models.dart';
import 'package:imdb/domain/usecases/base_usecase.dart';

import '../repository/repository.dart';

class GetTop250MovieUseCase extends BaseUseCase<void, List<Movie>> {
  final Repository _repo;
  GetTop250MovieUseCase(this._repo);
  @override
  Future<Either<Failure, List<Movie>>> start(void input) async {
    return await _repo.getTop250Movie();
  }
}
