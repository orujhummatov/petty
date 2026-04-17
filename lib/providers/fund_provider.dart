import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_data.dart';

final donationsProvider = Provider((_) => MockData.donations);
final expensesProvider = Provider((_) => MockData.expenses);
final spendingStrategyProvider = Provider((_) => MockData.spendingStrategy);
