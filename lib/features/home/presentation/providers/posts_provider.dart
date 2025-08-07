import 'package:flutter_posteary/core/di/injections.dart';
import 'package:flutter_posteary/shared/features/posts/domain/entities/post_entity.dart';
import 'package:flutter_posteary/shared/features/posts/domain/use_cases/get_all_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides a [FutureProvider] that asynchronously fetches a list of [PostEntity] 
/// using the [PostsUseCase]. This provider can be used to access the posts data 
/// throughout the application.
final postsProvider = FutureProvider<List<PostEntity>>((ref) async {
  final postsUseCase = di<PostsUseCase>();
  return await postsUseCase();
});
