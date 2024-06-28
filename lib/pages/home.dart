import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/pages/favorite_page.dart';
import 'package:news_app/pages/view_all.dart';
import 'package:news_app/widgets/build_trending_list.dart';
import 'package:news_app/widgets/indicator_shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/build_slider_image.dart';
import 'detail_page.dart';

class Home extends StatelessWidget {
  final controller = Get.put<HomeController>(HomeController());
  Home({super.key});

  Widget buildPhoneView() {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            Text("App "),
            Text(
              "Flutter",
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 12.w, bottom: 16.h),
        child: SizedBox(
          height: 56.h,
          width: 56.w,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(
                () => FavoritePage(),
                transition: Transition.circularReveal,
                duration: const Duration(milliseconds: 800),
              );
            },
            backgroundColor: Colors.indigo,
            shape: const CircleBorder(),
            elevation: 6.0.r,
            child: Icon(
              Icons.favorite_rounded,
              size: 40.0.r,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            await controller.getBreakingArticle();
            await controller.getTrendingArticle();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ///[BREAKING NEWS SECTION]///
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Breaking News",
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Merriweather",
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Get.to(
                            () => ViewAll(title: "Breaking News"),
                            transition: Transition.fadeIn,
                            duration: const Duration(microseconds: 1200),
                          );
                          await controller.viewAllBreakingNews();
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                            fontFamily: "Merriweather",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                CarouselSlider.builder(
                  itemCount: controller.breakingArticlesList?.articles.length ?? 3,
                  itemBuilder: (context, index, realIndex) {
                    if (controller.isBreakingLoaded.value) {
                      String? image = controller.breakingArticlesList?.articles[index].urlToImage;
                      String? title = controller.breakingArticlesList?.articles[index].title;

                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => DetailedPage(
                              imageUrl: controller.breakingArticlesList!.articles[index].urlToImage ??
                                  "assets/default.jpg",
                              title: controller.breakingArticlesList!.articles[index].title ??
                                  "[TITLE NOT AVAILABLE]",
                              description: controller.breakingArticlesList!.articles[index].description ??
                                  "[DESCRIPTION NOT AVAILABLE]",
                              article: Article(
                                title: controller.breakingArticlesList!.articles[index].title ??
                                    "[TITLE NOT AVAILABLE]",
                                description: controller.breakingArticlesList!.articles[index].description ??
                                    "[DESCRIPTION NOT AVAILABLE]",
                                urlToImage: controller.breakingArticlesList!.articles[index].urlToImage ??
                                    "assets/default.jpg",
                              ),
                            ),
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 800),
                          );
                        },
                        child: buildSliderImagePhone(
                          image!,
                          index,
                          title!,
                        ),
                      );
                    } else {
                      return buildShimmerPlaceholder();
                    }
                  },
                  options: CarouselOptions(
                      height: 200.h,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        controller.activeIndex.value = index;
                      }),
                ),
                SizedBox(height: 14.h),
                controller.isBreakingLoaded.value
                    ? AnimatedSmoothIndicator(
                        activeIndex: controller.activeIndex.value,
                        count: controller.breakingArticlesList?.articles.length ?? 0,
                        effect: WormEffect(
                          dotHeight: 10.h,
                          dotWidth: 10.w,
                          type: WormType.normal,
                          activeDotColor: Colors.indigo,
                        ),
                      )
                    : buildIndicatorShimmer(),

                SizedBox(height: 12.h),

                ///[TRENDING NEWS SECTION]///
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending News",
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Merriweather",
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Get.to(
                            () => ViewAll(title: "Trending News"),
                            transition: Transition.fadeIn,
                            duration: const Duration(microseconds: 1200),
                          );
                          await controller.viewAllTrendingNews();
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                            fontFamily: "Merriweather",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.trendingArticleList?.articles.length ?? 4,
                  itemBuilder: (context, index) {
                    if (controller.isTrendingLoaded.value) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 4.h),
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(12.r),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 5.0.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => DetailedPage(
                                    imageUrl: controller.trendingArticleList!.articles[index].urlToImage ??
                                        "assets/default.jpg",
                                    title: controller.trendingArticleList!.articles[index].title ??
                                        "[TITLE NOT AVAILABLE]",
                                    description:
                                        controller.trendingArticleList!.articles[index].description ??
                                            "[DESCRIPTION NOT AVAILABLE",
                                    article: Article(
                                      title: controller.trendingArticleList!.articles[index].title ??
                                          "[TITLE NOT AVAILABLE]",
                                      description:
                                          controller.trendingArticleList!.articles[index].description ??
                                              "[DESCRIPTION NOT AVAILABLE",
                                      urlToImage:
                                          controller.trendingArticleList!.articles[index].urlToImage ??
                                              "assets/default.jpg",
                                    ),
                                  ),
                                  transition: Transition.leftToRightWithFade,
                                  duration: const Duration(milliseconds: 800),
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: controller.trendingArticleList?.articles[index].urlToImage !=
                                              null
                                          ? CachedNetworkImage(
                                              imageUrl:
                                                  controller.trendingArticleList!.articles[index].urlToImage!,
                                              // height: 120.h,
                                              // width: 120.w,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              "assets/default.jpg",
                                              // height: 120.h,
                                              // width: 120.w,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.trendingArticleList?.articles[index].title ??
                                              "[TITLE NOT AVAILABLE]",
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontFamily: "Merriweather",
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          controller.trendingArticleList?.articles[index].description ??
                                              "[DESCRIPTION NOT AVAILABLE]",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontFamily: "Merriweather",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return buildTrendingListShimmer();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTabletView() {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 16.sp,
              ),
            ),
            Text(
              "App ",
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            Text(
              "Flutter",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(
                () => FavoritePage(),
                transition: Transition.circularReveal,
                duration: const Duration(milliseconds: 800),
              );
            },
            backgroundColor: Colors.indigo,
            shape: const CircleBorder(),
            elevation: 12.0.r,
            child: Icon(
              Icons.favorite_rounded,
              size: 80.0.r,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            await controller.getBreakingArticle();
            await controller.getTrendingArticle();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ///[BREAKING NEWS SECTION]///
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Breaking News",
                        style: TextStyle(
                          fontSize: 9.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Merriweather",
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Get.to(
                            () => ViewAll(title: "Breaking News"),
                            transition: Transition.fadeIn,
                            duration: const Duration(microseconds: 1200),
                          );
                          await controller.viewAllBreakingNews();
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 6.0.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                            fontFamily: "Merriweather",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                CarouselSlider.builder(
                  itemCount: controller.breakingArticlesList?.articles.length ?? 3,
                  itemBuilder: (context, index, realIndex) {
                    if (controller.isBreakingLoaded.value) {
                      String? image = controller.breakingArticlesList?.articles[index].urlToImage;
                      String? title = controller.breakingArticlesList?.articles[index].title;

                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => DetailedPage(
                              imageUrl: controller.breakingArticlesList!.articles[index].urlToImage ??
                                  "assets/default.jpg",
                              title: controller.breakingArticlesList!.articles[index].title ??
                                  "[TITLE NOT AVAILABLE]",
                              description: controller.breakingArticlesList!.articles[index].description ??
                                  "[DESCRIPTION NOT AVAILABLE]",
                              article: Article(
                                title: controller.breakingArticlesList!.articles[index].title ??
                                    "[TITLE NOT AVAILABLE]",
                                description: controller.breakingArticlesList!.articles[index].description ??
                                    "[DESCRIPTION NOT AVAILABLE]",
                                urlToImage: controller.breakingArticlesList!.articles[index].urlToImage ??
                                    "assets/default.jpg",
                              ),
                            ),
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 800),
                          );
                        },
                        child: buildSliderImageTablet(
                          image!,
                          index,
                          title!,
                        ),
                      );
                    } else {
                      return buildShimmerPlaceholderTablet();
                    }
                  },
                  options: CarouselOptions(
                      height: 350.h,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        controller.activeIndex.value = index;
                      }),
                ),
                SizedBox(height: 20.h),
                controller.isBreakingLoaded.value
                    ? AnimatedSmoothIndicator(
                        activeIndex: controller.activeIndex.value,
                        count: controller.breakingArticlesList?.articles.length ?? 0,
                        effect: WormEffect(
                          dotHeight: 25.h,
                          dotWidth: 8.w,
                          type: WormType.normal,
                          activeDotColor: Colors.indigo,
                        ),
                      )
                    : buildIndicatorShimmer(),

                SizedBox(height: 8.h),

                ///[TRENDING NEWS SECTION]///
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending News",
                        style: TextStyle(
                          fontSize: 9.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "Merriweather",
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Get.to(
                            () => ViewAll(title: "Trending News"),
                            transition: Transition.fadeIn,
                            duration: const Duration(microseconds: 1200),
                          );
                          await controller.viewAllTrendingNews();
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 6.0.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                            fontFamily: "Merriweather",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.trendingArticleList?.articles.length ?? 4,
                  itemBuilder: (context, index) {
                    if (controller.isTrendingLoaded.value) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 6.h),
                        child: Material(
                          elevation: 6.0,
                          borderRadius: BorderRadius.circular(16.r),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 6.0.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => DetailedPage(
                                    imageUrl: controller.trendingArticleList!.articles[index].urlToImage ??
                                        "assets/default.jpg",
                                    title: controller.trendingArticleList!.articles[index].title ??
                                        "[TITLE NOT AVAILABLE]",
                                    description:
                                        controller.trendingArticleList!.articles[index].description ??
                                            "[DESCRIPTION NOT AVAILABLE",
                                    article: Article(
                                      title: controller.trendingArticleList!.articles[index].title ??
                                          "[TITLE NOT AVAILABLE]",
                                      description:
                                          controller.trendingArticleList!.articles[index].description ??
                                              "[DESCRIPTION NOT AVAILABLE",
                                      urlToImage:
                                          controller.trendingArticleList!.articles[index].urlToImage ??
                                              "assets/default.jpg",
                                    ),
                                  ),
                                  transition: Transition.leftToRightWithFade,
                                  duration: const Duration(milliseconds: 800),
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: controller.trendingArticleList?.articles[index].urlToImage != null
                                        ? CachedNetworkImage(
                                            imageUrl:
                                                controller.trendingArticleList!.articles[index].urlToImage!,
                                            height: 320.h,
                                            width: 120.w,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            "assets/default.jpg",
                                            height: 320.h,
                                            width: 120.w,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.trendingArticleList?.articles[index].title ??
                                              "[TITLE NOT AVAILABLE]",
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontFamily: "Merriweather",
                                            fontWeight: FontWeight.w800,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        SizedBox(height: 6.h),
                                        Text(
                                          controller.trendingArticleList?.articles[index].description ??
                                              "[DESCRIPTION NOT AVAILABLE]",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 5,
                                          style: TextStyle(
                                            fontFamily: "Merriweather",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return buildTrendingListShimmerTablet();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    controller.isTabletView.value = isTablet;
    controller.getBreakingArticle();
    controller.getTrendingArticle();

    return isTablet ? buildTabletView() : buildPhoneView();
  }
}
