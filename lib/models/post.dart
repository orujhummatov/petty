class Post {
  const Post({
    required this.id,
    required this.author,
    required this.avatar,
    required this.description,
    required this.image,
    required this.likes,
    required this.comments,
  });

  final String id;
  final String author;
  final String avatar;
  final String description;
  final String image;
  final int likes;
  final int comments;
}
