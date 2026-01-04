import 'dart:io';

class OrderEntity {
  final String name;
  final String category;
  final List<File> imageList;

  OrderEntity({
    required this.name,
    required this.category,
    required this.imageList,
  });
}
