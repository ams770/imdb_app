import 'package:imdb/app/app_constants.dart';
import 'package:imdb/data/response/responses.dart';
import 'package:imdb/domain/models/models.dart';
import 'package:imdb/app/extensions.dart';

extension NonNullMovieResponse on MovieResponse? {
  Movie toDomain() => Movie(
        this?.id.orEmpty() ??  AppConstants.empty,
        this?.rank.orEmpty() ??  AppConstants.empty,
        this?.title.orEmpty() ??  AppConstants.empty,
        this?.fullTitle.orEmpty() ??  AppConstants.empty,
        this?.year.orEmpty() ??  AppConstants.empty,
        this?.image.orEmpty() ??  AppConstants.empty,
        this?.crew.orEmpty() ??  AppConstants.empty,
        this?.imDbRating.orEmpty() ??  AppConstants.empty,
        this?.imDbRatingCount.orEmpty() ??  AppConstants.empty,
      );
}
