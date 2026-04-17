import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/feed_provider.dart';
import '../../widgets/common/network_image_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stories = ref.watch(storiesProvider);
    final posts = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Petty Feed')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Create post Coming Soon')),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Create Post'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => Future<void>.delayed(const Duration(milliseconds: 800)),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(
              height: 92,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) => Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [Color(0xFF1565C0), Color(0xFF42A5F5)]),
                  ),
                  child: CircleAvatar(radius: 34, backgroundImage: NetworkImage(stories[i])),
                ),
              ),
            ).animate().fadeIn(),
            const SizedBox(height: 12),
            ...posts.map(
              (post) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(backgroundImage: NetworkImage(post.avatar)),
                        title: Text(post.author),
                        subtitle: const Text('2h ago'),
                      ),
                      NetworkImageCard(url: post.image),
                      const SizedBox(height: 10),
                      Text(post.description),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(onPressed: () {}, icon: const Icon(Icons.favorite_border), label: Text('${post.likes}')),
                          TextButton.icon(onPressed: () {}, icon: const Icon(Icons.mode_comment_outlined), label: Text('${post.comments}')),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
                          ElevatedButton(onPressed: () {}, child: const Text('Donate')),
                        ],
                      ),
                    ],
                  ),
                ),
              ).animate().slideY(begin: .06, duration: 350.ms),
            ),
          ],
        ),
      ),
    );
  }
}
