import 'package:dartz/dartz.dart';
import 'package:imdb/data/mapper/mapper.dart';
import 'package:imdb/domain/models/models.dart';
import 'package:imdb/app/extensions.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../response/responses.dart';

class RepositoryImpl extends Repository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _dataSource;
  RepositoryImpl(this._networkInfo, this._dataSource);
  
  

  @override
  Future<Either<Failure, List<Movie>>> getTop250Movie()async {
    if (await _networkInfo.isConnected) {
      try {
        MoviesResponse res = await _dataSource.getTop250Movie();
        // business error
        if (res.errorMsg.orEmpty().isNotEmpty) {
          return Left(Failure(1, res.errorMsg.orEmpty()));
        }
        
        List<Movie> movies = [];
        if (res.items != null) {
          for (MovieResponse movie in res.items!) {
            movies.add(movie.toDomain());
          }        
        }

        return Right(movies);
        
      } catch (e) {
        
        ///todo implement your error handler first then use it here
        
        // request error
         return Left(Failure(1, "something went wrong, please try again later"));
      }
    } else {
      // connection error
      return Left(Failure(1, "please check your internet connection"));
    }
    
  }
}
