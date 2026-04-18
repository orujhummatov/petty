import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../providers/fund_provider.dart';

class FundScreen extends ConsumerWidget {
  const FundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donations = ref.watch(donationsProvider);
    final expenses = ref.watch(expensesProvider);
    final totalDonated = donations.fold<double>(0, (a, b) => a + b.amount);
    final totalSpent = expenses.fold<double>(0, (a, b) => a + b.amount);
    final formatter = NumberFormat.currency(symbol: '₼', decimalDigits: 0);
    final tabHeight = (MediaQuery.sizeOf(context).height * 0.55).clamp(320.0, 700.0);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('Fund / Kassa'), bottom: const TabBar(tabs: [Tab(text: 'Incoming Donations'), Tab(text: 'Expenses')])),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.go('/fund/donate'),
          icon: const Icon(Icons.volunteer_activism),
          label: const Text('Donate Now'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(Icons.account_balance_wallet, size: 48, color: Color(0xFF1565C0)),
                    const SizedBox(height: 8),
                    const Text('Total Funds Raised', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 4),
                    Text(formatter.format(totalDonated), style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF1565C0))),
                    const SizedBox(height: 12),
                    Text('Current Balance: ${formatter.format(totalDonated - totalSpent)}', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ).animate().shimmer(duration: 1200.ms),
            const SizedBox(height: 8),
            Row(
              children: [
                _summaryCard(context, 'Total Donated', formatter.format(totalDonated)),
                _summaryCard(context, 'Total Spent', formatter.format(totalSpent)),
                _summaryCard(context, 'Animals Helped', '137'),
              ],
            ),
            SizedBox(
              height: tabHeight,
              child: TabBarView(
                children: [const _DonationsTab(), _ExpensesTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard(BuildContext context, String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 6),
              Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}

class _DonationsTab extends ConsumerWidget {
  const _DonationsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final f = DateFormat('dd MMM yyyy');
    return ListView(
      children: ref.watch(donationsProvider).map((d) => Card(child: ListTile(leading: const Icon(Icons.savings_outlined), title: Text(d.donor), subtitle: Text(f.format(d.date)), trailing: Text('₼${d.amount.toStringAsFixed(0)}')))).toList(),
    );
  }
}

class _ExpensesTab extends ConsumerWidget {
  const _ExpensesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final f = DateFormat('dd MMM yyyy');
    return ListView(
      children: ref.watch(expensesProvider).map((e) => Card(
        child: ListTile(
          leading: const Icon(Icons.receipt_long_outlined),
          title: Text(e.purpose),
          subtitle: Text('${e.category} • ${f.format(e.date)}'),
          trailing: TextButton(
            onPressed: () => context.go('/fund/proof/${e.id}'),
            child: const Text('View Proof'),
          ),
        ),
      )).toList(),
    );
  }
}