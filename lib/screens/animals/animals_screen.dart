import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../models/animal.dart';
import '../../providers/animals_provider.dart';
import '../../widgets/common/network_image_card.dart';

class AnimalsScreen extends ConsumerWidget {
  const AnimalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animals & Guardianship'),
          bottom: const TabBar(tabs: [Tab(text: 'Shelter Animals'), Tab(text: 'Distant Foster Care')]),
        ),
        body: const TabBarView(children: [_ShelterAnimalsTab(), _GuardianshipTab()]),
      ),
    );
  }
}

class _ShelterAnimalsTab extends ConsumerWidget {
  const _ShelterAnimalsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animals = ref.watch(shelterAnimalsProvider);
    final isGrid = ref.watch(isAnimalsGridProvider);
    final filter = ref.watch(animalTypeFilterProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            FilterChip(label: const Text('All'), selected: filter == null, onSelected: (_) => ref.read(animalTypeFilterProvider.notifier).state = null),
            const SizedBox(width: 8),
            FilterChip(label: const Text('Dogs'), selected: filter == AnimalType.dog, onSelected: (_) => ref.read(animalTypeFilterProvider.notifier).state = AnimalType.dog),
            const SizedBox(width: 8),
            FilterChip(label: const Text('Cats'), selected: filter == AnimalType.cat, onSelected: (_) => ref.read(animalTypeFilterProvider.notifier).state = AnimalType.cat),
            const Spacer(),
            IconButton(
              onPressed: () => ref.read(isAnimalsGridProvider.notifier).state = !isGrid,
              icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
            ),
          ],
        ),
        if (isGrid)
          MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: animals.length,
            itemBuilder: (_, i) => _animalCard(context, animals[i]),
          )
        else
          ...animals.map((a) => _animalCard(context, a)),
      ],
    );
  }

  Widget _animalCard(BuildContext context, Animal a) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => context.go('/animals/${a.id}'),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NetworkImageCard(url: a.images.first, height: 120),
              const SizedBox(height: 8),
              Text(a.name, style: Theme.of(context).textTheme.titleMedium),
              Text('${a.breed} • ${a.age}'),
              Text(a.location),
              const SizedBox(height: 4),
              Chip(label: Text(a.healthStatus)),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuardianshipTab extends ConsumerWidget {
  const _GuardianshipTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animals = ref.watch(guardianshipAnimalsProvider);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        FilledButton.icon(
          onPressed: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (sheetContext) => Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(sheetContext).bottom),
              child: const _SubmitAnimalSheet(),
            ),
          ),
          icon: const Icon(Icons.add_circle_outline),
          label: const Text('Submit Animal'),
        ),
        const SizedBox(height: 8),
        ...animals.map(
          (a) => Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(a.images.first)),
              title: Text(a.name),
              subtitle: Text('${a.guardianName} • ₼${a.monthlyFee?.toStringAsFixed(0)} / month'),
              trailing: Chip(label: Text(a.guardianshipStatus ?? 'Pending')),
            ),
          ),
        ),
      ],
    );
  }
}

class _SubmitAnimalSheet extends StatelessWidget {
  const _SubmitAnimalSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Application Form', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          const TextField(decoration: InputDecoration(labelText: 'Animal description')),
          const TextField(decoration: InputDecoration(labelText: 'Location')),
          const SizedBox(height: 12),
          FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Submit')),
        ],
      ),
    );
  }
}
