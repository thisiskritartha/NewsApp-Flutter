import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/article_model.dart';

Future<NewsArticle?> getArticles(String url) async {
  final response = await http.get(Uri.parse(url));
  try {
    if (response.statusCode == 200) {
      var data = NewsArticle.fromJson(json.decode(response.body));
      return data;
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  } catch (e) {
    return null;
  }
}
