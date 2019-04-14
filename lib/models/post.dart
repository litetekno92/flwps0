class Post {
  // final String title;
  // final String thumbnailUrl;
  Guid title;
  Content content;
  Content excerpt;
  int author;
  int featuredMedia;
  //Embedded embedded;

  // Post._({this.title, this.thumbnailUrl});
  Post._({
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
  ///  this.embedded,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post._(
      // title: json['title']['rendered']
      title: Guid.fromJson(json["title"]),
      content: Content.fromJson(json["content"]),
      excerpt: Content.fromJson(json["excerpt"]),
      author: json["author"],
      featuredMedia: json["featured_media"],
   //   embedded: Embedded.fromJson(json["_embedded"]),
    );
    // thumbnailUrl: json['thumbnailUrl'],
  }
}

class Content {
  String rendered;
  bool protected;

  Content({
    this.rendered,
    this.protected,
  });

  factory Content.fromJson(Map<String, dynamic> json) => new Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Guid {
  String rendered;

  Guid({
    this.rendered,
  });

  factory Guid.fromJson(Map<String, dynamic> json) => new Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

