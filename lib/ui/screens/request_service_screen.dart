import 'package:flutter/material.dart';
import '../../model/space_service.dart';
import '../../model/space_order.dart';
import '../../repository/orbital_data.dart';
import '../../navigation/app_routes.dart';
import '../components/orbit_top_bar.dart';

class RequestServiceScreen extends StatefulWidget {
  final SpaceService service;
  const RequestServiceScreen({super.key, required this.service});

  @override
  State<RequestServiceScreen> createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _urgencyController = TextEditingController();

  @override
  void dispose() {
    _regionController.dispose();
    _urgencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrbitTopBar(title: "Novo Pedido"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Serviço: ${widget.service.name}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _regionController,
              decoration: const InputDecoration(
                labelText: "Região de Interesse (Ex: Bacia do Xingu)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _urgencyController,
              decoration: const InputDecoration(
                labelText: "Nível de Urgência",
                hintText: "Normal / Alta / Crítica",
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final region = _regionController.text.isNotEmpty
                      ? _regionController.text
                      : "Região não informada";
                  final urgency = _urgencyController.text.isNotEmpty
                      ? _urgencyController.text
                      : "Normal";

                  final newOrder = SpaceOrder(
                    id: 'PED-0${OrbitalData.myOrders.length + 1}',
                    date: '30/05/2026',
                    status: 'Aguardando',
                    urgency: urgency,
                    totalValue: widget.service.price,
                    region: region,
                    service: widget.service,
                  );
                  OrbitalData.myOrders.add(newOrder);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Pedido enviado para $region com urgência $urgency!',
                      ),
                    ),
                  );
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(AppRoutes.home),
                  );
                },
                child: const Text("Confirmar Pedido"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
