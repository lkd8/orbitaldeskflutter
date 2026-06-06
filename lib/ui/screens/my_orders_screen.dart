import 'package:flutter/material.dart';
import '../../repository/orbital_data.dart';
import '../../navigation/app_routes.dart';
import '../components/orbit_top_bar.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrbitTopBar(title: "Meus Pedidos"),
      body: OrbitalData.myOrders.isEmpty
          ? const Center(
              child: Text(
                "Nenhum pedido encontrado.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListView.builder(
                itemCount: OrbitalData.myOrders.length,
                itemBuilder: (context, index) {
                  final order = OrbitalData.myOrders[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      title: Text(
                        "${order.id} - ${order.service.name}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Status: ${order.status}\nData: ${order.date}",
                      ),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            order.status == 'Entregue'
                                ? Icons.check_circle
                                : Icons.hourglass_top,
                            color: order.status == 'Entregue'
                                ? Colors.green
                                : Colors.orange,
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.redAccent,
                            ),
                            tooltip: 'Deletar Pedido',
                            onPressed: () {
                              setState(() {
                                OrbitalData.myOrders.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Pedido ${order.id} removido com sucesso.',
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.orderDetail,
                        arguments: order,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
