import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_data.dart';

enum AppLanguage { az, en }

final currentUserProvider = Provider((_) => MockData.user);
final leaderboardProvider = Provider((_) => MockData.leaderboard);
final badgesProvider = Provider((_) => MockData.badges);
final languageProvider = StateProvider<AppLanguage>((_) => AppLanguage.az);
final notificationsEnabledProvider = StateProvider<bool>((_) => true);
