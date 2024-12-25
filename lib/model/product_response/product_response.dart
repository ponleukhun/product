import 'package:freezed_annotation/freezed_annotation.dart';

import 'dimensions.dart';
import 'meta.dart';
import 'review.dart';

part 'gen/product_response.freezed.dart';

part 'gen/product_response.g.dart';

@unfreezed
class ProductResponse with _$ProductResponse {
  @JsonSerializable(fieldRename: FieldRename.none)
  factory ProductResponse({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
