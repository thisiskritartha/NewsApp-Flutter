import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/build_slider_image.dart';

class Home extends StatelessWidget {
  final controller = Get.put<HomeController>(HomeController());
  Home({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Obx(
        () => SingleChildScrollView(
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
                      "Breaking News!",
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Merriweather",
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                        fontFamily: "Merriweather",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              CarouselSlider.builder(
                itemCount: controller.sliders.length,
                itemBuilder: (context, index, realIndex) {
                  String? image = controller.sliders[index].image;
                  String? name = controller.sliders[index].name;
                  return buildSliderImage(image!, index, name!);
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
              AnimatedSmoothIndicator(
                activeIndex: controller.activeIndex.value,
                count: controller.sliders.length,
                effect: WormEffect(
                  dotHeight: 10.h,
                  dotWidth: 10.w,
                  type: WormType.normal,
                  activeDotColor: Colors.indigo,
                ),
              ),

              SizedBox(height: 12.h),

              ///[TRENDING NEWS SECTION]///
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending News!",
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Merriweather",
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                        fontFamily: "Merriweather",
                      ),
                    ),
                  ],
                ),
              ),

              //SizedBox(height: 4.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 4.h),
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(12.r),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 5.0.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset(
                              "assets/1.jpg",
                              height: 120.h,
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
                                  "This is the title for news.",
                                  style: TextStyle(
                                    fontFamily: "Merriweather",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "This is the description section for news. Here we will provide the short "
                                  "description of the news. Thank you.",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  style: TextStyle(
                                    fontFamily: "Merriweather",
                                    fontWeight: FontWeight.w800,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
