import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/animals/animal_detail_screen.dart';
import '../screens/animals/animals_screen.dart';
import '../screens/fund/fund_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/shelters/shelter_detail_screen.dart';
import '../screens/shelters/shelters_screen.dart';
import '../screens/splash/splash_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/', builder: (_, __) => const MainShell(index: 0)),
      GoRoute(path: '/shelters', builder: (_, __) => const MainShell(index: 1)),
      GoRoute(path: '/fund', builder: (_, __) => const MainShell(index: 2)),
      GoRoute(path: '/animals', builder: (_, __) => const MainShell(index: 3)),
      GoRoute(path: '/profile', builder: (_, __) => const MainShell(index: 4)),
      GoRoute(path: '/shelters/:id', builder: (_, state) => ShelterDetailScreen(id: state.pathParameters['id']!)),
      GoRoute(path: '/animals/:id', builder: (_, state) => AnimalDetailScreen(id: state.pathParameters['id']!)),
    ],
  );
});

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(),
      const SheltersScreen(),
      const FundScreen(),
      const AnimalsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          const routes = ['/', '/shelters', '/fund', '/animals', '/profile'];
          context.go(routes[value]);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.home_work_outlined), selectedIcon: Icon(Icons.home_work), label: 'Shelters'),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), selectedIcon: Icon(Icons.account_balance_wallet), label: 'Fund'),
          NavigationDestination(icon: Icon(Icons.pets_outlined), selectedIcon: Icon(Icons.pets), label: 'Animals'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
