import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_data.dart';

final shelterSearchProvider = StateProvider<String>((_) => '');
final sheltersProvider = Provider((ref) {
  final q = ref.watch(shelterSearchProvider).toLowerCase().trim();
  return MockData.shelters
      .where((s) => s.name.toLowerCase().contains(q) || s.location.toLowerCase().contains(q))
      .toList();
});
