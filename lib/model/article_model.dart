class NewsArticle {
  NewsArticle({
    required this.articles,
  });

  final List<Article> articles;

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      articles: json["articles"] == null
          ? []
          : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
    );
  }
}

class Article {
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });

  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      content: json["content"],
    );
  }
}
