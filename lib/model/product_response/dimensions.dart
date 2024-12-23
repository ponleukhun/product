import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/dimensions.freezed.dart';

part 'gen/dimensions.g.dart';

@freezed
class Dimensions with _$Dimensions {
  factory Dimensions({
    double? width,
    double? height,
    double? depth,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
}
