import 'package:flutter_posteary/shared/features/posts/data/datasources/posts_datasource.dart';
import 'package:flutter_posteary/shared/features/posts/data/mappers/post_mapper.dart';
import 'package:flutter_posteary/shared/features/posts/data/models/post_model.dart';
import 'package:flutter_posteary/shared/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_posteary/shared/features/posts/domain/repositories/posts_repository.dart';

/// Implementation of the PostsRepository interface that interacts with the
/// data source to fetch post data.
class PostsRepositoryImpl implements PostsRepository {
  final PostsApiDataSourceImpl postsDataSourceImpl;

  PostsRepositoryImpl({required this.postsDataSourceImpl});

  /// Retrieves all posts from the data source and converts them to a list of PostEntity.
  ///
  /// Returns a [Future] that completes with a list of [PostEntity] objects.
  @override
  Future<List<PostEntity>> getAll() async {
    final List<PostModel> res = await postsDataSourceImpl.getAll();
    return res
        .map((postModel) => PostMapper.postModelToEntity(postModel))
        .toList();
  }
}
