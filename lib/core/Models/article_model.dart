class NewsArticle {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  NewsArticle({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
        source: json["source"] != null ? Source.fromJson(json["source"]) : null,
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] != null
            ? DateTime.parse(json["publishedAt"])
            : null,
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is NewsArticle &&
  //         runtimeType == other.runtimeType &&
  //         source == other.source &&
  //         author == other.author &&
  //         title == other.title &&
  //         description == other.description &&
  //         url == other.url &&
  //         urlToImage == other.urlToImage &&
  //         publishedAt == other.publishedAt &&
  //         content == other.content;

  // @override
  // int get hashCode =>
  //     source.hashCode ^
  //     author.hashCode ^
  //     title.hashCode ^
  //     description.hashCode ^
  //     url.hashCode ^
  //     urlToImage.hashCode ^
  //     publishedAt.hashCode ^
  //     content.hashCode;
}

class Source {
  String? id;
  String? name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Source &&
  //         runtimeType == other.runtimeType &&
  //         id == other.id &&
  //         name == other.name;

  // @override
  // int get hashCode => id.hashCode ^ name.hashCode;
}
