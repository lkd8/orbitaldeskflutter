import 'package:flutter/material.dart';
import '../model/space_service.dart';
import '../model/space_order.dart';

class OrbitalData {
  static const List<SpaceService> catalog = [
    SpaceService(id: 'S1', name: 'Análise de Vegetação (NDVI)', description: 'Ideal para o agronegócio. Identifica saúde da plantação e estresse hídrico.', price: 250.0, deliveryDays: 2, category: 'Agro', icon: Icons.grass),
    SpaceService(id: 'S2', name: 'Monitoramento de Cheias', description: 'Para Defesa Civil e Prefeituras. Mapeamento de áreas alagadas por SAR.', price: 400.0, deliveryDays: 1, category: 'Urbano', icon: Icons.water),
    SpaceService(id: 'S3', name: 'Detecção de Queimadas', description: 'Identificação de focos de calor ativos e cicatrizes de fogo.', price: 300.0, deliveryDays: 1, category: 'Meio Ambiente', icon: Icons.local_fire_department),
    SpaceService(id: 'S4', name: 'Mapeamento Mineral', description: 'Análise hiperespectral para identificação de depósitos minerais superficiais.', price: 850.0, deliveryDays: 5, category: 'Mineração', icon: Icons.landscape),
    SpaceService(id: 'S5', name: 'Expansão Urbana', description: 'Monitoramento de crescimento horizontal de metrópoles e ocupações irregulares.', price: 500.0, deliveryDays: 3, category: 'Urbano', icon: Icons.location_city),
    SpaceService(id: 'S6', name: 'Monitoramento de Fronteiras', description: 'Identificação de desmatamento ilegal e pistas de pouso clandestinas.', price: 900.0, deliveryDays: 2, category: 'Meio Ambiente', icon: Icons.security),
    SpaceService(id: 'S7', name: 'Análise de Solo Nua', description: 'Previsão de erosão e preparo de terra para novas safras usando dados óticos.', price: 350.0, deliveryDays: 2, category: 'Agro', icon: Icons.agriculture),
    SpaceService(id: 'S8', name: 'Topografia de Cavas', description: 'Cálculo de volume de extração em minas a céu aberto via altimetria a laser.', price: 1200.0, deliveryDays: 4, category: 'Mineração', icon: Icons.terrain),
  ];

  static List<SpaceOrder> myOrders = [
    SpaceOrder(id: 'PED-001', date: '28/05/2026', status: 'Entregue', urgency: 'Normal', totalValue: 250.0, region: 'Fazenda Rio Grande - Lote 4', service: catalog[0]),
    SpaceOrder(id: 'PED-002', date: '30/05/2026', status: 'Em análise', urgency: 'Alta', totalValue: 400.0, region: 'Bacia do Rio Tietê - SP', service: catalog[1]),
    SpaceOrder(id: 'PED-003', date: '01/06/2026', status: 'Aguardando', urgency: 'Normal', totalValue: 500.0, region: 'Periferia Leste - SP', service: catalog[4]),
    SpaceOrder(id: 'PED-004', date: '02/06/2026', status: 'Entregue', urgency: 'Crítica', totalValue: 900.0, region: 'Fronteira Norte - AM', service: catalog[5]),
    SpaceOrder(id: 'PED-005', date: '02/06/2026', status: 'Em análise', urgency: 'Normal', totalValue: 1200.0, region: 'Mina do Quadrilátero Ferrífero', service: catalog[7]),
  ];

  static List<String> getCategories() {
    return ['Todos', 'Agro', 'Urbano', 'Meio Ambiente', 'Mineração'];
  }
}