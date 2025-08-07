import 'package:flutter_posteary/shared/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_posteary/shared/features/posts/domain/repositories/posts_repository.dart';

/// A use case class for retrieving all posts from the repository.
///
/// This class interacts with the `PostsRepository` to fetch a list of
/// `PostEntity` objects. It encapsulates the logic required to perform
/// this operation, providing a clean API for use in the application.
///
/// The `call` method returns a `Future` that resolves to a list of
/// `PostEntity` instances, representing all posts available in the
/// repository.
class PostsUseCase {
  final PostsRepository repository;

  PostsUseCase({required this.repository});

  Future<List<PostEntity>> call() {
    return repository.getAll();
  }
}
