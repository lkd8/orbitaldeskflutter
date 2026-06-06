import 'package:flutter/material.dart';
import '../../model/space_service.dart';

class ServiceCard extends StatelessWidget {
  final SpaceService service;
  final Function(SpaceService)? onClick;

  const ServiceCard({super.key, required this.service, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent.withValues(alpha: 0.2),
          child: Icon(service.icon, color: Colors.blueAccent),
        ),
        title: Text(
          service.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(service.category),
        trailing: const Icon(Icons.chevron_right),
        onTap: onClick != null ? () => onClick!(service) : null,
      ),
    );
  }
}
