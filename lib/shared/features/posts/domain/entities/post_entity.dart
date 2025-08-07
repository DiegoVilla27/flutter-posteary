/// A class representing a post entity with attributes such as id, title,
/// description, creation date, number of likes, and user ID.
///
/// This class is used to encapsulate the data related to a post, providing
/// a structured way to manage and access post information.
class PostEntity {
  String id;
  String title;
  String description;
  String createDate;
  int likes;
  String idUser;

  PostEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.createDate,
    required this.likes,
    required this.idUser,
  });
}