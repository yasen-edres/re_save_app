import 'package:json_annotation/json_annotation.dart';

part 'item_dto.g.dart';

@JsonSerializable()
class ItemDto {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "description")
  final String? description;

  @JsonKey(name: "image")
  final String? image;

  @JsonKey(name: "pricing_type")
  final String? pricingType;

  @JsonKey(name: "price")
  final String? price;

  @JsonKey(name: "is_active")
  final int? isActive;

  @JsonKey(name: "created_at")
  final dynamic createdAt;

  @JsonKey(name: "updated_at")
  final dynamic updatedAt;

  @JsonKey(name: "category")
  final String? category;

  ItemDto({
    this.id,
    this.name,
    this.description,
    this.image,
    this.pricingType,
    this.price,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory ItemDto.fromJson(Map<String, dynamic> json) =>
      _$ItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDtoToJson(this);
}
