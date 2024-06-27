import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';

import '../model/article_model.dart';
import '../widgets/fav_icon.dart';

class DetailedPage extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  final Article? article;

  final controller = Get.put<HomeController>(HomeController());

  DetailedPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.0.r,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        actions: [
          FavoriteIcon(article: article),
          SizedBox(width: 6.0.w),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0.r),
                child: imageUrl != "assets/default.jpg"
                    ? CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                        height: 250.0.h,
                        width: double.infinity,
                      )
                    : Image.asset(
                        "assets/default.jpg",
                        fit: BoxFit.cover,
                        height: 250.0.h,
                        width: double.infinity,
                      ),
              ),
              SizedBox(height: 12.h),
              Text(
                title!,
                style: TextStyle(
                  fontFamily: "Merriweather",
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                description!,
                style: TextStyle(
                  fontFamily: "Merriweather",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
