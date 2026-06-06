import 'package:flutter/material.dart';

class SpaceService {
  final String id;
  final String name;
  final String description;
  final double price;
  final int deliveryDays;
  final String category;
  final IconData icon;

  const SpaceService({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.deliveryDays,
    required this.category,
    required this.icon,
  });
}
