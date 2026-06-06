import 'package:flutter/material.dart';
import '../../model/space_order.dart';
import '../components/orbit_top_bar.dart';

class OrderDetailScreen extends StatelessWidget {
  final SpaceOrder order;
  const OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrbitTopBar(title: "Pedido ${order.id}"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Serviço: ${order.service.name}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("Região Alvo: ${order.region}"),
                    Text("Urgência: ${order.urgency}"),
                    Text(
                      "Valor Pago: R\$ ${order.totalValue.toStringAsFixed(2)}",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Status da Análise Orbital:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.satellite_alt, color: Colors.blue),
              title: const Text("Satélite posicionado"),
              subtitle: Text("Imagens coletadas em ${order.date}"),
            ),
            ListTile(
              leading: Icon(
                order.status == 'Entregue' ? Icons.done_all : Icons.pending,
                color: order.status == 'Entregue'
                    ? Colors.green
                    : Colors.orange,
              ),
              title: Text("Status Atual: ${order.status}"),
              subtitle: const Text("Processamento pelo Analista Espacial"),
            ),
            const Spacer(),
            if (order.status == 'Entregue')
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text("Baixar Relatório (PDF)"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
