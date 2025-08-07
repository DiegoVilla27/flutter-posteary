import 'package:flutter_posteary/shared/features/posts/data/models/post_model.dart';
import 'package:flutter_posteary/shared/features/posts/domain/entities/post_entity.dart';

/// Converts a [PostModel] instance to a [PostEntity] instance.
///
/// This method maps the properties of a [PostModel] to a [PostEntity],
/// ensuring that all relevant fields such as id, title, description,
/// createDate, likes, and idUser are transferred correctly.
class PostMapper {
  static PostEntity postModelToEntity(PostModel actor) => PostEntity(
    id: actor.id,
    title: actor.title,
    description: actor.description,
    createDate: actor.createDate,
    likes: actor.likes,
    idUser: actor.idUser,
  );
}
