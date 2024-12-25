import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/review.freezed.dart';

part 'gen/review.g.dart';

@unfreezed
class Review with _$Review {
  @JsonSerializable(fieldRename: FieldRename.none)
  factory Review({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
