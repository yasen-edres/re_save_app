import 'confirm_items.dart';

class ConfirmOrder {
  final int? id;
  final int? userId;
  final dynamic? address;
  final dynamic? latitude;
  final dynamic? longitude;
  final dynamic? riderId;
  final String? status;
  final int? totalQuantity;
  final int? totalPoints;
  final String? scheduledAt;
  final String? createdAt;
  final String? updatedAt;
  final List<ConfirmItems>? items;

  ConfirmOrder ({
    this.id,
    this.userId,
    this.address,
    this.latitude,
    this.longitude,
    this.riderId,
    this.status,
    this.totalQuantity,
    this.totalPoints,
    this.scheduledAt,
    this.createdAt,
    this.updatedAt,
    this.items,
  });


}