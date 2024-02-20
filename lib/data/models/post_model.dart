// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  final String id;
  final String username;
  final String content;
  int likes;
  final List<Comment>? comments;

  Post({
    required this.id,
    required this.username,
    required this.content,
    this.likes = 0,
     this.comments,
  });

  Post copyWith({
    String? id,
    String? username,
    String? content,
    int? likes,
    List<Comment>? comments,
  }) {
    return Post(
      id: id ?? this.id,
      username: username ?? this.username,
      content: content ?? this.content,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
    );
  }
}

class Comment {
  final String username;
  final String content;

  Comment({
    required this.username,
    required this.content,
  });
}
