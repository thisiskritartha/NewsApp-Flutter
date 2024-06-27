import 'package:get/get.dart';

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
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  RxBool isFav = false.obs;

  final String? title;
  final String? description;
  final String? urlToImage;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json["title"],
      description: json["description"],
      urlToImage: json["urlToImage"],
    );
  }
}
