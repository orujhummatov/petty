import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/animals/animal_detail_screen.dart';
import '../screens/animals/animals_screen.dart';
import '../screens/fund/donate_screen.dart';
import '../screens/fund/expense_proof_screen.dart';
import '../screens/fund/fund_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/profile/subscription_screen.dart';
import '../screens/shelters/shelter_detail_screen.dart';
import '../screens/shelters/shelters_screen.dart';
import '../screens/splash/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
          GoRoute(
            path: '/shelters',
            builder: (_, __) => const SheltersScreen(),
            routes: [
              GoRoute(
                path: ':id',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (_, state) => ShelterDetailScreen(id: state.pathParameters['id']!),
              ),
            ],
          ),
          GoRoute(
            path: '/fund',
            builder: (_, __) => const FundScreen(),
            routes: [
              GoRoute(
                path: 'donate',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (_, __) => const DonateScreen(),
              ),
              GoRoute(
                path: 'proof/:id',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (_, state) => ExpenseProofScreen(expenseId: state.pathParameters['id']!),
              ),
            ],
          ),
          GoRoute(
            path: '/animals',
            builder: (_, __) => const AnimalsScreen(),
            routes: [
              GoRoute(
                path: ':id',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (_, state) => AnimalDetailScreen(id: state.pathParameters['id']!),
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            builder: (_, __) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: 'subscription',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (_, __) => const SubscriptionScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
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

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/profile')) return 4;
    if (location.startsWith('/animals')) return 3;
    if (location.startsWith('/fund')) return 2;
    if (location.startsWith('/shelters')) return 1;
    return 0;
  }
}