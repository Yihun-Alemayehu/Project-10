class Post {
  final String id;
  final String username;
  final String content;
  final int likes;
  final List<Comment>? comments;

  Post({
    required this.id,
    required this.username,
    required this.content,
    this.likes = 0,
     this.comments,
  });
}

class Comment {
  final String username;
  final String content;

  Comment({
    required this.username,
    required this.content,
  });
}
