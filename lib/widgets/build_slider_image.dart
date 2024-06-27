import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget buildSliderImage(String image, int index, String name) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6.w),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: image != "assets/default.jpg"
              ? CachedNetworkImage(
                  imageUrl: image,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  image,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
        ),
        Container(
          height: 200.h,
          width: double.infinity,
          padding: EdgeInsets.only(left: 10.w),
          margin: EdgeInsets.only(top: 130.h),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Merriweather",
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildShimmerPlaceholder() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6.w),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    ),
  );
}
