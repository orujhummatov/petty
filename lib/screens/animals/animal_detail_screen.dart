import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../widgets/common/network_image_card.dart';

class AnimalDetailScreen extends StatelessWidget {
  const AnimalDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final animal = MockData.animals.firstWhere((a) => a.id == id);
    return Scaffold(
      appBar: AppBar(title: Text(animal.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 230,
            child: PageView(
              children: animal.images.map((u) => Padding(padding: const EdgeInsets.only(right: 8), child: NetworkImageCard(url: u, height: 230))).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Text('${animal.breed} • ${animal.age} • ${animal.gender}', style: Theme.of(context).textTheme.titleMedium),
          Text('Location: ${animal.location}'),
          Chip(label: Text('Health: ${animal.healthStatus}')),
          const SizedBox(height: 8),
          Text(animal.story),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: FilledButton(onPressed: () {}, child: const Text('Adopt'))),
              const SizedBox(width: 8),
              Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Become Guardian'))),
            ],
          ),
        ],
      ),
    );
  }
}
