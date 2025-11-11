class Singleblogmodel {
    final String id;
    final String title;
    final String content;
    final String excerpt;
    final dynamic featuredImage;
    final Author author;
    final List<String> categories;
    final List<String> tags;
    final int readTime;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int likeCount;
    final String commentCount;
    final bool isLiked;
    final bool isBookmarked;

    Singleblogmodel({
        required this.id,
        required this.title,
        required this.content,
        required this.excerpt,
        required this.featuredImage,
        required this.author,
        required this.categories,
        required this.tags,
        required this.readTime,
        required this.createdAt,
        required this.updatedAt,
        required this.likeCount,
        required this.commentCount,
        required this.isLiked,
        required this.isBookmarked,
    });

    factory Singleblogmodel.fromJson(Map<String, dynamic> json) => Singleblogmodel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        excerpt: json["excerpt"],
        featuredImage: json["featured_image"],
        author: Author.fromJson(json["author"]),
        categories: List<String>.from(json["categories"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        readTime: json["read_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        likeCount: json["like_count"],
        commentCount: json["comment_count"],
        isLiked: json["is_liked"],
        isBookmarked: json["is_bookmarked"],
    );

}

class Author {
    final String id;
    final String name;
    final String avatar;
    final String bio;

    Author({
        required this.id,
        required this.name,
        required this.avatar,
        required this.bio,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        bio: json["bio"],
    );

}
