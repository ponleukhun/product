import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/meta.freezed.dart';

part 'gen/meta.g.dart';

@freezed
class Meta with _$Meta {
  factory Meta({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
