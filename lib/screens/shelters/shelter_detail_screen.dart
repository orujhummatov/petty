import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/mock_data.dart';
import '../../providers/animals_provider.dart';
import '../../widgets/common/network_image_card.dart';

class ShelterDetailScreen extends ConsumerWidget {
  const ShelterDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelter = MockData.shelters.firstWhere((s) => s.id == id);
    final animals = ref.watch(shelterAnimalsProvider).where((a) => a.shelterId == id).toList();

    return Scaffold(
      appBar: AppBar(title: Text(shelter.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          NetworkImageCard(url: shelter.coverPhoto),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: shelter.gallery.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, index) =>
                  SizedBox(width: 160, child: NetworkImageCard(url: shelter.gallery[index], height: 110)),
            ),
          ),
          const SizedBox(height: 12),
          const Card(
            child: ListTile(
              leading: Icon(Icons.map_outlined),
              title: Text('Map Placeholder'),
              subtitle: Text('Interactive map can be connected in production'),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Animal Breakdown', style: Theme.of(context).textTheme.titleMedium),
                  ...shelter.breakdown.entries.map((e) => Text('${e.key}: ${e.value}')),
                  const SizedBox(height: 8),
                  Text('Contact: ${shelter.contact}'),
                  const SizedBox(height: 8),
                  FilledButton(onPressed: () {}, child: const Text('Follow')),
                ],
              ),
            ),
          ),
          Text('Animals in this shelter', style: Theme.of(context).textTheme.titleMedium),
          ...animals.map((a) => Card(child: ListTile(leading: CircleAvatar(backgroundImage: NetworkImage(a.images.first)), title: Text(a.name), subtitle: Text('${a.breed} • ${a.healthStatus}')))),
        ],
      ),
    );
  }
}
