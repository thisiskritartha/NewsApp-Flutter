import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/services/slider_data.dart';

import '../model/slider_model.dart';
import '../services/news_article.dart';

class HomeController extends GetxController {
  List<SliderModel> sliders = [];
  NewsArticle? breakingArticlesList;
  NewsArticle? trendingArticleList;
  RxInt activeIndex = 0.obs;

  @override
  void onInit() async {
    sliders = getSliders();
    breakingArticlesList = await getBreakingArticles();
    trendingArticleList = await getTrendingArticles();
    super.onInit();
  }

  Future<dynamic> getBreakingArticle() async {
    try {
      final response = await getBreakingArticles();
      return response;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error fetching News data article. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
      return null;
    }
  }

  Future<dynamic> getTrendingArticle() async {
    try {
      final response = await getTrendingArticles();
      return response;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error fetching News data article. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
      return null;
    }
  }
}
