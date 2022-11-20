
import 'app_constants.dart';

extension NonNullString on String? {
  String orEmpty() => this ?? AppConstants.empty;
}

extension NonNullInt on int? {
  int orZero() => this ?? AppConstants.zero;
}

extension NonNullDouble on double? {
  double orZero() => this ?? AppConstants.zeroD;
}
