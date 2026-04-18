import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_provider.dart';

class SubscriptionScreen extends ConsumerStatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  ConsumerState<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> {
  late double _amount;

  @override
  void initState() {
    super.initState();
    _amount = 20;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Subscription')), 
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(Icons.autorenew, size: 64, color: Color(0xFF1565C0)),
          const SizedBox(height: 16),
          Text('Monthly Subscription', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Current: ₼${user.subscription.toStringAsFixed(0)}/month', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
          const SizedBox(height: 32),
          Text('Select new amount:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Slider(
            value: _amount,
            min: 5,
            max: 200,
            divisions: 39,
            label: '₼${_amount.toInt()}',
            onChanged: (v) => setState(() => _amount = v),
          ),
          Text('₼${_amount.toInt()} / month', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF1565C0))),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            alignment: WrapAlignment.center,
            children: [10, 20, 50, 100].map((a) => ActionChip(
              label: Text('₼$a'),
              onPressed: () => setState(() => _amount = a.toDouble()),
            )).toList(),
          ),
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  icon: const Icon(Icons.check_circle, color: Colors.green, size: 48),
                  title: const Text('Subscription Updated'),
                  content: Text('Your monthly subscription has been changed to ₼${_amount.toInt()}/month.'),
                  actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('OK'))],
                ),
              );
            },
            icon: const Icon(Icons.save),
            label: const Text('Save Changes'),
            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  icon: const Icon(Icons.warning_amber, color: Colors.orange, size: 48),
                  title: const Text('Cancel Subscription?'),
                  content: const Text('Are you sure you want to cancel your monthly subscription?'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('No')),
                    TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('Yes, Cancel', style: TextStyle(color: Colors.red))),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.cancel_outlined, color: Colors.red),
            label: const Text('Cancel Subscription', style: TextStyle(color: Colors.red)),
            style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          ),
        ],
      ),
    );
  }
}