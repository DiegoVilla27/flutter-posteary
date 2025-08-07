import 'package:flutter_posteary/shared/features/posts/domain/entities/post_entity.dart';

/// An abstract repository interface for managing posts.
abstract class PostsRepository {
  /// Retrieves a list of all post entities.
  ///
  /// Returns a [Future] that completes with a list of [PostEntity] objects.
  Future<List<PostEntity>> getAll();
}
