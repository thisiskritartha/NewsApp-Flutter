import 'package:news_app/constants/api_key.dart';

const String breakingUrl = "https://newsapi.org/v2/everything?q=Nepal&pageSize=5&apiKey=$apiKey";

const String trendingUrl = "https://newsapi.org/v2/everything?q=Trending&pageSize=10&apiKey=$apiKey";

const String viewAllBreaking = "https://newsapi.org/v2/everything?q=Nepal&pageSize=30&apiKey=$apiKey";

const String viewAllTrending = "https://newsapi.org/v2/everything?q=Trending&pageSize=80&apiKey=$apiKey";
