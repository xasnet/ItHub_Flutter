// lib/models/post.dart

class Post {
  final int id;
  final String title;
  final String content;
  final String author;
  final DateTime date;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.date,
  });
}