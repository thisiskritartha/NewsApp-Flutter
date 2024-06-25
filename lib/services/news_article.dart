import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/article_model.dart';

import '../constants/string_constants.dart';

getBreakingArticles() async {
  final response = await http.get(Uri.parse(breakingUrl));
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

getTrendingArticles() async {
  final response = await http.get(Uri.parse(trendingUrl));
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
