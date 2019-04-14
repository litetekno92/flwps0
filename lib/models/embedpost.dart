// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}

String postToJson(List<Post> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class Post {
    int id;
    DateTime date;
    DateTime dateGmt;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    String status;
    String type;
    String link;
    Title title;
    Content content;
    Content excerpt;
    int featuredMedia;
    List<int> categories;
    List<dynamic> tags;
    Embedded embedded;

    Post({
        this.id,
        this.date,
        this.dateGmt,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.excerpt,
        this.featuredMedia,
        this.categories,
        this.tags,
        this.embedded,
    });

    factory Post.fromJson(Map<String, dynamic> json) => new Post(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Title.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        featuredMedia: json["featured_media"],
        categories: new List<int>.from(json["categories"].map((x) => x)),
        tags: new List<dynamic>.from(json["tags"].map((x) => x)),
        embedded: Embedded.fromJson(json["_embedded"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "featured_media": featuredMedia,
        "categories": new List<dynamic>.from(categories.map((x) => x)),
        "tags": new List<dynamic>.from(tags.map((x) => x)),
        "_embedded": embedded.toJson(),
    };
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

class Embedded {
    List<Author> author;
    List<WpFeaturedmedia> wpFeaturedmedia;

    Embedded({
        this.author,
        this.wpFeaturedmedia,
    });

    factory Embedded.fromJson(Map<String, dynamic> json) => new Embedded(
        author: new List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        wpFeaturedmedia: new List<WpFeaturedmedia>.from(json["wp:featuredmedia"].map((x) => WpFeaturedmedia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "author": new List<dynamic>.from(author.map((x) => x.toJson())),
        "wp:featuredmedia": new List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
    };
}

class Author {
    int id;
    String name;
    String url;
    String description;
    String link;
    String slug;
    Map<String, String> avatarUrls;
    Links links;

    Author({
        this.id,
        this.name,
        this.url,
        this.description,
        this.link,
        this.slug,
        this.avatarUrls,
        this.links,
    });

    factory Author.fromJson(Map<String, dynamic> json) => new Author(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        slug: json["slug"],
        avatarUrls: new Map.from(json["avatar_urls"]).map((k, v) => new MapEntry<String, String>(k, v)),
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "description": description,
        "link": link,
        "slug": slug,
        "avatar_urls": new Map.from(avatarUrls).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "_links": links.toJson(),
    };
}

class Links {
    List<Collection> self;
    List<Collection> collection;

    Links({
        this.self,
        this.collection,
    });

    factory Links.fromJson(Map<String, dynamic> json) => new Links(
        self: new List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
        collection: new List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": new List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": new List<dynamic>.from(collection.map((x) => x.toJson())),
    };
}

class Collection {
    String href;

    Collection({
        this.href,
    });

    factory Collection.fromJson(Map<String, dynamic> json) => new Collection(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class WpFeaturedmedia {
    int id;
    DateTime date;
    String slug;
    String type;
    String link;
    Title title;
    String sourceUrl;

    WpFeaturedmedia({
        this.id,
        this.date,
        this.slug,
        this.type,
        this.link,
        this.title,
        this.sourceUrl,
    });

    factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) => new WpFeaturedmedia(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        slug: json["slug"],
        type: json["type"],
        link: json["link"],
        title: Title.fromJson(json["title"]),
        sourceUrl: json["source_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "slug": slug,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "source_url": sourceUrl,
    };
}

class Title {
    String rendered;

    Title({
        this.rendered,
    });

    factory Title.fromJson(Map<String, dynamic> json) => new Title(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}

