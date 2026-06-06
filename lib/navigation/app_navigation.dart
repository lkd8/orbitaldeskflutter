import 'package:flutter/material.dart';
import '../model/space_service.dart';
import '../model/space_order.dart';
import '../ui/screens/splash_screen.dart';
import '../ui/screens/onboarding_screen.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/service_detail_screen.dart';
import '../ui/screens/request_service_screen.dart';
import '../ui/screens/my_orders_screen.dart';
import '../ui/screens/order_detail_screen.dart';
import 'app_routes.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case AppRoutes.intro:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardingScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case AppRoutes.serviceDetail:
        final service = settings.arguments as SpaceService;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ServiceDetailScreen(service: service),
        );
      case AppRoutes.requestService:
        final service = settings.arguments as SpaceService;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => RequestServiceScreen(service: service),
        );
      case AppRoutes.myOrders:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyOrdersScreen(),
        );
      case AppRoutes.orderDetail:
        final order = settings.arguments as SpaceOrder;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OrderDetailScreen(order: order),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Rota não encontrada'))),
        );
    }
  }
}
