import 'space_service.dart';

class SpaceOrder {
  final String id;
  final String date;
  final String status;
  final String urgency;
  final double totalValue;
  final String region;
  final SpaceService service;

  const SpaceOrder({
    required this.id,
    required this.date,
    required this.status,
    required this.urgency,
    required this.totalValue,
    required this.region,
    required this.service,
  });
}
