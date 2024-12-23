import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/review.freezed.dart';

part 'gen/review.g.dart';

@freezed
class Review with _$Review {
  factory Review({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
