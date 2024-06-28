import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/detail_page.dart';

import '../controller/home_controller.dart';
import '../model/article_model.dart';

class ViewAll extends StatelessWidget {
  final controller = Get.put<HomeController>(HomeController());
  final String title;

  ViewAll({super.key, required this.title});

  Widget buildPhoneView() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 18.0.r,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.viewAllList?.articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.0.h),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => DetailedPage(
                    imageUrl: controller.viewAllList!.articles[index].urlToImage ?? "assets/default.jpg",
                    title: controller.viewAllList!.articles[index].title ?? "[TITLE NOT AVAILABLE]",
                    description:
                        controller.viewAllList!.articles[index].description ?? "[DESCRIPTION NOT AVAILABLE]",
                    article: Article(
                      title: controller.viewAllList!.articles[index].title ?? "[TITLE NOT AVAILABLE]",
                      description:
                          controller.viewAllList!.articles[index].description ?? "[DESCRIPTION NOT AVAILABLE",
                      urlToImage: controller.viewAllList!.articles[index].urlToImage ?? "assets/default.jpg",
                    ),
                  ),
                  transition: Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 800),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.0.r),
                    child: controller.viewAllList?.articles[index].urlToImage != null
                        ? CachedNetworkImage(
                            imageUrl: controller.viewAllList!.articles[index].urlToImage!,
                            fit: BoxFit.cover,
                            height: 180.0.h,
                            width: double.infinity,
                          )
                        : Image.asset(
                            "assets/default.jpg",
                            fit: BoxFit.cover,
                            height: 180.0.h,
                            width: double.infinity,
                          ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: Text(
                      controller.viewAllList?.articles[index].title ?? "[TITLE NOT AVAILABLE]",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: Text(
                      controller.viewAllList?.articles[index].description ?? "[DESCRIPTION NOT AVAILABLE]",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTabletView() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 28.0.r,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            fontSize: 12.sp,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.viewAllList?.articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 4.0.h),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => DetailedPage(
                    imageUrl: controller.viewAllList!.articles[index].urlToImage ?? "assets/default.jpg",
                    title: controller.viewAllList!.articles[index].title ?? "[TITLE NOT AVAILABLE]",
                    description:
                        controller.viewAllList!.articles[index].description ?? "[DESCRIPTION NOT AVAILABLE]",
                    article: Article(
                      title: controller.viewAllList!.articles[index].title ?? "[TITLE NOT AVAILABLE]",
                      description:
                          controller.viewAllList!.articles[index].description ?? "[DESCRIPTION NOT AVAILABLE",
                      urlToImage: controller.viewAllList!.articles[index].urlToImage ?? "assets/default.jpg",
                    ),
                  ),
                  transition: Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 800),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "Image",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0.r),
                      child: controller.viewAllList?.articles[index].urlToImage != null
                          ? CachedNetworkImage(
                              imageUrl: controller.viewAllList!.articles[index].urlToImage!,
                              fit: BoxFit.cover,
                              height: 380.0.h,
                              width: double.infinity,
                            )
                          : Image.asset(
                              "assets/default.jpg",
                              fit: BoxFit.cover,
                              height: 380.0.h,
                              width: double.infinity,
                            ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                    child: Text(
                      controller.viewAllList?.articles[index].title ?? "[TITLE NOT AVAILABLE]",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.w800,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: Text(
                      controller.viewAllList?.articles[index].description ?? "[DESCRIPTION NOT AVAILABLE]",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.w500,
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    controller.isTabletView.value = isTablet;
    title == "Trending News" ? controller.viewAllTrendingNews() : controller.viewAllBreakingNews();

    return isTablet ? buildTabletView() : buildPhoneView();
  }
}
