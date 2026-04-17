import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/mock_data.dart';
import '../../providers/fund_provider.dart';

class FundScreen extends ConsumerWidget {
  const FundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donations = ref.watch(donationsProvider);
    final expenses = ref.watch(expensesProvider);
    final strategy = ref.watch(spendingStrategyProvider);
    final totalDonated = donations.fold<double>(0, (a, b) => a + b.amount);
    final totalSpent = expenses.fold<double>(0, (a, b) => a + b.amount);
    final formatter = NumberFormat.currency(symbol: '₼', decimalDigits: 0);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('Fund / Kassa'), bottom: const TabBar(tabs: [Tab(text: 'Incoming Donations'), Tab(text: 'Expenses')])),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {}, icon: const Icon(Icons.volunteer_activism), label: const Text('Donate Now')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: ListTile(
                title: const Text('Current Fund Balance'),
                subtitle: Text(formatter.format(totalDonated - totalSpent), style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              ),
            ).animate().shimmer(duration: 1200.ms),
            const SizedBox(height: 8),
            Card(
              child: SizedBox(
                height: 240,
                child: PieChart(
                  PieChartData(
                    sections: strategy.entries
                        .toList()
                        .asMap()
                        .entries
                        .map(
                          (e) => PieChartSectionData(
                            value: e.value.value,
                            title: '${e.value.key}\n${e.value.value.toInt()}%',
                            color: MockData.strategyColors[e.key],
                            radius: 78,
                            titleStyle: const TextStyle(fontSize: 11, color: Colors.white),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                _summaryCard(context, 'Total Donated', formatter.format(totalDonated)),
                _summaryCard(context, 'Total Spent', formatter.format(totalSpent)),
                _summaryCard(context, 'Animals Helped', '137'),
              ],
            ),
            const SizedBox(
              height: 560,
              child: TabBarView(
                children: [_DonationsTab(), _ExpensesTab()],
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
      children: ref.watch(expensesProvider).map((e) => Card(child: ListTile(leading: const Icon(Icons.receipt_long_outlined), title: Text(e.purpose), subtitle: Text('${e.category} • ${f.format(e.date)}'), trailing: TextButton(onPressed: () {}, child: const Text('View Proof'))))).toList(),
    );
  }
}
