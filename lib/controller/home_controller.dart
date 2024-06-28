import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/string_constants.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/pages/home.dart';

import '../services/news_article.dart';

class HomeController extends GetxController {
  NewsArticle? breakingArticlesList;
  NewsArticle? trendingArticleList;
  NewsArticle? viewAllList;
  RxInt activeIndex = 0.obs;
  RxBool isFav = false.obs;
  var favList = <Article>[].obs;
  RxBool isTabletView = false.obs;

  RxBool isTrendingLoaded = false.obs;
  RxBool isBreakingLoaded = false.obs;

  Future<void> getBreakingArticle() async {
    try {
      final response = await getArticles(breakingUrl);
      if (response != null) {
        isBreakingLoaded.value = true;
        breakingArticlesList = response;
      }
    } catch (e) {
      isTabletView.value
          ? Get.snackbar(
              'Error fetching News article',
              'Check your connection and try again.',
              titleText: Text(
                "Error fetching News article",
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              messageText: Text(
                'Check your connection and try again.',
                style: TextStyle(
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
            )
          : Get.snackbar(
              'Error fetching News article',
              'Check your connection and try again.',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
            );
    }
  }

  Future<void> getTrendingArticle() async {
    try {
      final response = await getArticles(trendingUrl);
      if (response != null) {
        isTrendingLoaded.value = true;
        trendingArticleList = response;
      }
    } catch (e) {
      isTabletView.value
          ? Get.snackbar(
              'Error fetching News article',
              'Check your connection and try again.',
              titleText: Text(
                "Error fetching News article",
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              messageText: Text(
                'Check your connection and try again.',
                style: TextStyle(
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
            )
          : Get.snackbar(
              'Error fetching News article',
              'Check your connection and try again.',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
            );
    }
  }

  Future<void> viewAllBreakingNews() async {
    try {
      final response = await getArticles(viewAllBreaking);
      if (response != null) {
        viewAllList = response;
      }
    } catch (e) {
      isTabletView.value
          ? Get.snackbar(
              'Error fetching News article',
              'Check your connection and try again.',
              titleText: Text(
                "Error fetching News article",
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              messageText: Text(
                'Check your connection and try again.',
                style: TextStyle(
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
            )
          : Get.snackbar(
              'Error fetching News article',
              'Check your connection and try again.',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
            );
    }
  }

  Future<void> viewAllTrendingNews() async {
    try {
      final response = await getArticles(viewAllTrending);
      if (response != null) {
        viewAllList = response;
      }
    } catch (e) {
      isTabletView.value
          ? Get.snackbar(
              'Error fetching News article',
              'Check your connection and try again.',
              titleText: Text(
                "Error fetching News article",
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              messageText: Text(
                'Check your connection and try again.',
                style: TextStyle(
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
            )
          : Get.snackbar(
              'Error fetching News article',
              'Check your connection and try again.',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
            );
    }
  }

  void addToCart(Article article) {
    if (!favList.contains(article)) {
      favList.add(article);
    }
  }

  void removeFromCart(Article article) {
    if (favList.contains(article)) {
      favList.remove(article);
    }
  }

  void removeAll() {
    favList.clear();
    isTabletView.value
        ? Get.snackbar(
            'Clear All',
            'The favorite list has been cleared.',
            titleText: Text(
              "Favorite List Cleared",
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            messageText: Text(
              'The favorite list has been cleared.',
              style: TextStyle(
                fontSize: 7.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            colorText: Colors.black,
          )
        : Get.snackbar(
            'Clear All',
            'The favorite list has been cleared.',
            backgroundColor: Colors.white,
            colorText: Colors.black,
          );
    Get.offAll(Home());
  }
}
