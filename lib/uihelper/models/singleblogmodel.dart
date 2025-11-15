class Singleblogmodel {
  final String id;
  final String title;
  final String content;
  final String excerpt;
  final String featuredImage;
  final Author author;
  final List<String> categories;
  final List<String> tags;
  final int readTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int likeCount;
  final int commentCount;
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

  factory Singleblogmodel.fromJson(Map<String, dynamic> json) {
    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      return int.tryParse(v.toString()) ?? 0;
    }

    DateTime? _toDate(dynamic v) {
      if (v == null) return null;
      try {
        // handles "2024-11-04 15:45:00" and ISO formats
        String s = v.toString();
        if (s.contains(' ')) s = s.replaceFirst(' ', 'T');
        return DateTime.tryParse(s);
      } catch (_) {
        return null;
      }
    }

    List<String> _toStringList(dynamic v) {
      if (v == null) return [];
      if (v is List) return v.map((e) => e.toString()).toList();
      return [v.toString()];
    }

    return Singleblogmodel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      excerpt: json['excerpt']?.toString() ?? '',
      featuredImage: json['featured_image'].toString(),
      author: Author.fromJson(json['author'] ?? {}),
      categories: _toStringList(json['categories']),
      tags: _toStringList(json['tags']),
      readTime: _toInt(json['read_time']),
      createdAt: _toDate(json['created_at']),
      updatedAt: _toDate(json['updated_at']),
      likeCount: _toInt(json['like_count']),
      commentCount: _toInt(json['comment_count']),
      isLiked: (json['is_liked'] ?? false) == true,
      isBookmarked: (json['is_bookmarked'] ?? false) == true,
    );
  }
}

class Author {
  final String id;
  final String name;
  final String? avatar;
  final String? bio;

  Author({
    required this.id,
    required this.name,
    required this.avatar,
    required this.bio,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      avatar: json['avatar']?.toString(),
      bio: (json['bio'] == null || json['bio'].toString().isEmpty) ? null : json['bio'].toString(),
    );
  }
}
