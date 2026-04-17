import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_data.dart';
import '../models/animal.dart';

final animalTypeFilterProvider = StateProvider<AnimalType?>((_) => null);
final isAnimalsGridProvider = StateProvider<bool>((_) => true);

final shelterAnimalsProvider = Provider((ref) {
  final filter = ref.watch(animalTypeFilterProvider);
  return MockData.animals.where((a) {
    final inShelter = a.shelterId != null;
    final typeOk = filter == null || a.type == filter;
    return inShelter && typeOk;
  }).toList();
});

final guardianshipAnimalsProvider = Provider(
  (_) => MockData.animals.where((a) => a.guardianName != null).toList(),
);
