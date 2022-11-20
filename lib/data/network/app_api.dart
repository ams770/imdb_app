import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:imdb/data/response/responses.dart';
import 'package:retrofit/retrofit.dart';
import '../../app/app_constants.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ImdbServiceClient {
  factory ImdbServiceClient(Dio dio, {String baseUrl}) = _ImdbServiceClient;

  @GET(ApiEndPoints.top250Movie+AppConstants.apiKey)
  Future<MoviesResponse> getTop250Movie();
  
}

class ApiEndPoints{
  static const String top250Movie = "API/Top250Movies" ;
}