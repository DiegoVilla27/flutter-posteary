/// A model class representing a post with attributes such as id, title,
/// description, creation date, number of likes, and user id.
/// 
/// Provides a factory constructor to create an instance from a JSON map.
class PostModel {
  String id;
  String title;
  String description;
  String createDate;
  int likes;
  String idUser;

  PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createDate,
    required this.likes,
    required this.idUser,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createDate: json['createDate'] as String,
      likes: json['likes'] as int,
      idUser: json['idUser'] as String,
    );
  }
}