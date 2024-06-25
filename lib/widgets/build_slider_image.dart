import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildSliderImage(String image, int index, String name) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6.w),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
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
