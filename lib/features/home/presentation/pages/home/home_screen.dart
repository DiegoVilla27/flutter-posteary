import 'package:flutter/material.dart';
import 'package:flutter_posteary/features/home/presentation/providers/posts_provider.dart';
import 'package:flutter_posteary/shared/utils/numbers/number_format.dart';
import 'package:flutter_posteary/shared/widgets/snackbar/snackbar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A widget that displays a list of posts on the home screen.
///
/// The `HomeScreen` widget is a `ConsumerWidget` that listens to the
/// `postsProvider` to fetch and display a list of posts. It handles
/// different states of the data fetching process:
/// - Displays a loading indicator while the data is being fetched.
/// - Shows a message when no posts are available.
/// - Renders a list of posts with their title, description, likes, and
///   creation date when data is successfully retrieved.
/// - Displays an error message using a custom snackbar when an error occurs.
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
              margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white10,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    post.description,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 5.0,
                        children: [
                          Icon(
                            post.likes != 0
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                post.likes != 0
                                    ? Colors.redAccent
                                    : Colors.white,
                            size: 18,
                          ),
                          Text(
                            NumberFormats.humanReadableNumber(
                              post.likes.toDouble(),
                            ),
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        post.createDate,
                        style: TextStyle(fontSize: 12, color: Colors.white54),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (err, stack) =>
              SnackBarCustom.open(err.toString(), SnackbarType.error),
    );
  }
}
