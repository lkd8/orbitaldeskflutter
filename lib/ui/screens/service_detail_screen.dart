import 'package:flutter/material.dart';
import '../../model/space_service.dart';
import '../../navigation/app_routes.dart';
import '../components/orbit_top_bar.dart';

class ServiceDetailScreen extends StatelessWidget {
  final SpaceService service;
  const ServiceDetailScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrbitTopBar(title: service.name),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(service.icon, size: 80, color: Colors.blueAccent),
            ),
            const SizedBox(height: 24),
            Text(
              service.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(
                service.category,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            const SizedBox(height: 16),
            Text(service.description, style: const TextStyle(fontSize: 16)),
            const Divider(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Prazo estimado:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${service.deliveryDays} dias úteis",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Investimento:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "R\$ ${service.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F2833),
                  foregroundColor: const Color(0xFF66FCF1),
                ),
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutes.requestService,
                  arguments: service,
                ),
                child: const Text(
                  "Solicitar Análise",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
