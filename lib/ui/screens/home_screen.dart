import 'package:flutter/material.dart';
import '../../repository/orbital_data.dart';
import '../../model/space_service.dart';
import '../../navigation/app_routes.dart';
import '../components/orbit_top_bar.dart';
import '../components/service_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Todos';

  List<SpaceService> get filteredServices {
    if (selectedCategory == 'Todos') return OrbitalData.catalog;
    return OrbitalData.catalog
        .where((s) => s.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrbitTopBar(
        title: "Catálogo de Serviços",
        actions: [
          IconButton(
            icon: const Icon(Icons.list_alt),
            tooltip: 'Meus Pedidos',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.myOrders),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/catalog_header.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Monitoramento Global",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: OrbitalData.getCategories().length,
              itemBuilder: (context, index) {
                final cat = OrbitalData.getCategories()[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: selectedCategory == cat,
                    onSelected: (selected) =>
                        setState(() => selectedCategory = cat),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                final service = filteredServices[index];
                return ServiceCard(
                  service: service,
                  onClick: (s) => Navigator.pushNamed(
                    context,
                    AppRoutes.serviceDetail,
                    arguments: s,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
