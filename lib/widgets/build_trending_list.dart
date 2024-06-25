import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget buildTrendingListShimmer() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 4.h),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
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
                child: Container(
                  color: Colors.white,
                  height: 120.h,
                  width: 120.w,
                ),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 20.h,
                      width: double.infinity,
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      color: Colors.white,
                      height: 20.h,
                      width: double.infinity,
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      color: Colors.white,
                      height: 20.h,
                      width: double.infinity,
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      color: Colors.white,
                      height: 20.h,
                      width: double.infinity,
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      color: Colors.white,
                      height: 20.h,
                      width: double.infinity,
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
}
