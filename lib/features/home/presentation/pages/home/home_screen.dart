import 'package:flutter/material.dart';
import 'package:flutter_posteary/features/home/presentation/providers/posts_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return postsAsync.when(
      data: (posts) {
        if (posts.isEmpty) {
          return const Center(child: Text('No posts available'));
        }
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Container(
              color: Colors.deepPurple,
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
                trailing: Text('Likes: ${post.likes}'),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
