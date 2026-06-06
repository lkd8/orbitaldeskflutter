import 'package:flutter/material.dart';
import '../../navigation/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _pages = [
    {
      "title": "O que é o OrbitalDesk?",
      "desc":
          "O seu marketplace de dados satelitais. Peça uma análise do espaço e receba insights na Terra.",
      "icon": Icons.public,
    },
    {
      "title": "Como funciona?",
      "desc":
          "É como pedir um delivery! Escolha o tipo de análise, a região de interesse e o prazo desejado.",
      "icon": Icons.touch_app,
    },
    {
      "title": "Para quem é?",
      "desc":
          "Agricultores, prefeituras, seguradoras e mineradoras. Democratizamos o acesso ao espaço.",
      "icon": Icons.groups,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) =>
                    setState(() => _currentPage = page),
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _pages[index]["icon"],
                          size: 120,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          _pages[index]["title"],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _pages[index]["desc"],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (_currentPage != 0)
                  TextButton(
                    onPressed: () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    ),
                    child: const Text("Voltar"),
                  )
                else
                  const SizedBox(width: 80),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _pages.length - 1) {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(
                    _currentPage == _pages.length - 1 ? "Começar" : "Próximo",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
