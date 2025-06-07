import 'dart:convert';

class Comment {
  final String text;
  final DateTime date;

  Comment({required this.text, required this.date});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      text: json['text'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'date': date.toIso8601String(),
    };
  }

  static String encode(List<Comment> comments) => json.encode(
        comments.map<Map<String, dynamic>>((comment) => comment.toJson()).toList(),
      );

  static List<Comment> decode(String comments) =>
      (json.decode(comments) as List<dynamic>)
          .map<Comment>((item) => Comment.fromJson(item))
          .toList();
}
