class Commentsmodel {
  final String id;
  final String postId;
  final String userId;
  final String parentId;
  final String content;
  final String likesCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String authorName;
  final List<dynamic> replies;
  final Author author;
  final bool isLiked;

  Commentsmodel({
    required this.id,
    required this.postId,
    required this.userId,
    required this.parentId,
    required this.content,
    required this.likesCount,
    required this.createdAt,
    required this.updatedAt,
    required this.authorName,
    required this.replies,
    required this.author,
    required this.isLiked,
  });

  factory Commentsmodel.fromJson(Map<String, dynamic> json) => Commentsmodel(
    id: json["id"],
    postId: json["post_id"],
    userId: json["user_id"],
    parentId: json["parent_id"],
    content: json["content"],
    likesCount: json["likes_count"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    authorName: json["author_name"],
    replies: List<dynamic>.from(json["replies"].map((x) => x)),
    author: Author.fromJson(json["author"]),
    isLiked: json["is_liked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_id": postId,
    "user_id": userId,
    "parent_id": parentId,
    "content": content,
    "likes_count": likesCount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "author_name": authorName,
    "replies": List<dynamic>.from(replies.map((x) => x)),
    "author": author.toJson(),
    "is_liked": isLiked,
  };
}

class Author {
  final String id;
  final String name;
  final String email;
  final String avatar;

  Author({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "avatar": avatar,
  };
}
