import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/detail_page.dart';

import '../controller/home_controller.dart';

class FavoritePage extends StatelessWidget {
  final controller = Get.put<HomeController>(HomeController());
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          "Favorite List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        actions: [
          controller.favList.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Clear All",
                      titlePadding: EdgeInsets.only(top: 16.h),
                      middleText: "Are you sure you want to clear the favorite list?",
                      backgroundColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
                      titleStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      middleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                      textCancel: "No",
                      textConfirm: "Yes",
                      confirmTextColor: Colors.white,
                      cancelTextColor: Colors.indigo,
                      buttonColor: Colors.indigo,
                      onCancel: () {},
                      onConfirm: () {
                        controller.removeAll();
                      },
                    );
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    size: 24.r,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      body: Obx(
        () => controller.favList.isNotEmpty
            ? ListView.builder(
                itemCount: controller.favList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.0.h),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => DetailedPage(
                            imageUrl: controller.favList[index].urlToImage ?? "assets/default.jpg",
                            title: controller.favList[index].title ?? "[TITLE NOT AVAILABLE]",
                            description:
                                controller.favList[index].description ?? "[DESCRIPTION NOT AVAILABLE]",
                            article: controller.favList[index],
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
                            child: controller.favList[index].urlToImage != null
                                ? CachedNetworkImage(
                                    imageUrl: controller.favList[index].urlToImage!,
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
                              controller.favList[index].title ?? "[TITLE NOT AVAILABLE]",
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
                              controller.favList[index].description ?? "[DESCRIPTION NOT AVAILABLE]",
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
              )
            : Center(
                child: Text(
                  "No Any Favorite Article yet.",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Merriweather",
                  ),
                ),
              ),
      ),
    );
  }
}
