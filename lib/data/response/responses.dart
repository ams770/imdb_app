// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "rank")
  String? rank;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "fullTitle")
  String? fullTitle;
  @JsonKey(name: "year")
  String? year;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "crew")
  String? crew;
  @JsonKey(name: "imDbRating")
  String? imDbRating;
  @JsonKey(name: "imDbRatingCount")
  String? imDbRatingCount;
  MovieResponse(
    this.id,
    this.rank,
    this.title,
    this.fullTitle,
    this.year,
    this.image,
    this.crew,
    this.imDbRating,
    this.imDbRatingCount,
  );
  factory MovieResponse.fromJson(Map<String, dynamic> json) =>_$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class MoviesResponse {
  @JsonKey(name: "items")
  List<MovieResponse>? items;
  @JsonKey(name: "errorMessage")
  String? errorMsg;
  MoviesResponse(this.items, this.errorMsg);

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
