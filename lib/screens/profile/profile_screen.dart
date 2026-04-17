import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/fund_provider.dart';
import '../../providers/theme_provider.dart';
import '../../providers/user_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final leaderboard = ref.watch(leaderboardProvider);
    final badges = ref.watch(badgesProvider);
    final language = ref.watch(languageProvider);
    final isNotificationsOn = ref.watch(notificationsEnabledProvider);
    final donations = ref.watch(donationsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: CircleAvatar(radius: 28, backgroundImage: NetworkImage(user.avatar)),
            title: Text(user.name),
            subtitle: Text('Member since ${DateFormat('MMMM yyyy').format(user.memberSince)}'),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _stat('Total Donated', '₼${user.totalDonated.toStringAsFixed(0)}'),
                  _stat('Animals Helped', '${user.animalsHelped}'),
                  _stat('XP', '${user.xp}'),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Donation Summary'),
              subtitle: Text('Monthly subscription: ₼${user.subscription.toStringAsFixed(0)}'),
              trailing: OutlinedButton(onPressed: () {}, child: const Text('Change Subscription')),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('XP Level ${user.level}'),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: (user.xp % 500) / 500),
                ],
              ),
            ),
          ),
          Text('Badges', style: Theme.of(context).textTheme.titleMedium),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: badges
                .map((b) => Chip(
                      avatar: Icon((b['earned'] as bool) ? Icons.verified : Icons.lock_outline),
                      label: Text(b['title'] as String),
                    ))
                .toList(),
          ),
          const SizedBox(height: 12),
          Text('Leaderboard (Top 5)', style: Theme.of(context).textTheme.titleMedium),
          ...leaderboard.take(5).toList().asMap().entries.map(
                (e) => ListTile(
                  leading: CircleAvatar(child: Text('#${e.key + 1}')),
                  title: Text(e.value['name'].toString()),
                  trailing: Text('${e.value['xp']} XP'),
                ),
              ),
          const Divider(),
          Text('Donation History', style: Theme.of(context).textTheme.titleMedium),
          ...donations.take(8).map((d) => ListTile(title: Text(d.donor), subtitle: Text(DateFormat('dd MMM').format(d.date)), trailing: Text('₼${d.amount.toStringAsFixed(0)}'))),
          const Divider(),
          Text('Settings', style: Theme.of(context).textTheme.titleMedium),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (_) => ref.read(themeModeProvider.notifier).toggle(),
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            value: isNotificationsOn,
            onChanged: (v) => ref.read(notificationsEnabledProvider.notifier).state = v,
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: Text(language == AppLanguage.az ? 'AZ' : 'EN'),
            trailing: SegmentedButton<AppLanguage>(
              segments: const [
                ButtonSegment(value: AppLanguage.az, label: Text('AZ')),
                ButtonSegment(value: AppLanguage.en, label: Text('EN')),
              ],
              selected: {language},
              onSelectionChanged: (v) => ref.read(languageProvider.notifier).state = v.first,
            ),
          ),
          const ListTile(
            title: Text('About'),
            subtitle: Text('Petty helps street and shelter animals with transparent donations.'),
          ),
        ],
      ),
    );
  }

  Widget _stat(String title, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
