import 'package:flutter/material.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  bool _isMonthly = false;
  final _amountController = TextEditingController(text: '10');
  int _dayOfMonth = 1;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donate')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(Icons.volunteer_activism, size: 64, color: Color(0xFF1565C0)),
          const SizedBox(height: 16),
          Text('Support Animals', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(value: false, label: Text('One-time'), icon: Icon(Icons.payment)),
              ButtonSegment(value: true, label: Text('Monthly'), icon: Icon(Icons.autorenew)),
            ],
            selected: {_isMonthly},
            onSelectionChanged: (v) => setState(() => _isMonthly = v.first),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount (AZN)',
              prefixText: '₼ ',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [5, 10, 25, 50, 100].map((a) => ActionChip(
              label: Text('₼$a'),
              onPressed: () => setState(() => _amountController.text = '$a'),
            )).toList(),
          ),
          if (_isMonthly) ...[
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Payment day of month'),
              trailing: DropdownButton<int>(
                value: _dayOfMonth,
                items: List.generate(28, (i) => DropdownMenuItem(value: i + 1, child: Text('${i + 1}'))),
                onChanged: (v) => setState(() => _dayOfMonth = v ?? 1),
              ),
            ),
          ],
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  icon: const Icon(Icons.check_circle, color: Colors.green, size: 48),
                  title: const Text('Thank you!'),
                  content: Text(_isMonthly
                    ? 'Your monthly donation of ₼${_amountController.text} on day $_dayOfMonth has been set up.\nPayment system will be connected soon.'
                    : 'Your one-time donation of ₼${_amountController.text} is confirmed.\nPayment system will be connected soon.'),
                  actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('OK'))],
                ),
              );
            },
            icon: const Icon(Icons.payment),
            label: const Text('Proceed to Payment'),
            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          ),
        ],
      ),
    );
  }
}