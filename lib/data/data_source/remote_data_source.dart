import 'package:imdb/data/response/responses.dart';

import '../network/app_api.dart';

class RemoteDataSource {
  final ImdbServiceClient _client;
  RemoteDataSource(this._client);

  Future<MoviesResponse> getTop250Movie() async {
    return await _client.getTop250Movie();
  }
  
}
