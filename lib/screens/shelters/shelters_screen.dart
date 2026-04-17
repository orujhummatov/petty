import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/shelters_provider.dart';
import '../../widgets/common/network_image_card.dart';

class SheltersScreen extends ConsumerWidget {
  const SheltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shelters = ref.watch(sheltersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Partner Shelters')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search by shelter or city',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            onChanged: (v) => ref.read(shelterSearchProvider.notifier).state = v,
          ),
          const SizedBox(height: 12),
          ...shelters.map(
            (s) => Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => context.go('/shelters/${s.id}'),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NetworkImageCard(url: s.coverPhoto, height: 170),
                      const SizedBox(height: 10),
                      Text(s.name, style: Theme.of(context).textTheme.titleMedium),
                      Text('${s.location} • ${s.animalCount} animals • ⭐ ${s.rating}'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
