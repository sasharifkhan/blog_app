class Blogsmodel {
    final int id;
    final String title;
    final String excerpt;
    final String content;
    final String featuredImage;
    final Author author;
    final List<String> categories;
    final int readTime;
    final DateTime createdAt;
    final DateTime updatedAt;
    final dynamic likeCount;
    final String commentCount;
    final bool isLiked;
    final bool isBookmarked;

    Blogsmodel({
        required this.id,
        required this.title,
        required this.excerpt,
        required this.content,
        required this.featuredImage,
        required this.author,
        required this.categories,
        required this.readTime,
        required this.createdAt,
        required this.updatedAt,
        required this.likeCount,
        required this.commentCount,
        required this.isLiked,
        required this.isBookmarked,
    });

    factory Blogsmodel.fromJson(Map<String, dynamic> json) => Blogsmodel(
        id: json["id"],
        title: json["title"],
        excerpt: json["excerpt"],
        content: json["content"],
        featuredImage: json["featured_image"],
        author: Author.fromJson(json["author"]),
        categories: List<String>.from(json["categories"].map((x) => x)),
        readTime: json["read_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        likeCount: json["like_count"],
        commentCount: json["comment_count"],
        isLiked: json["is_liked"],
        isBookmarked: json["is_bookmarked"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "excerpt": excerpt,
        "content": content,
        "featured_image": featuredImage,
        "author": author.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "read_time": readTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "like_count": likeCount,
        "comment_count": commentCount,
        "is_liked": isLiked,
        "is_bookmarked": isBookmarked,
    };
}

class Author {
    final int id;
    final String name;
    final String avatar;

    Author({
        required this.id,
        required this.name,
        required this.avatar,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
    };
}