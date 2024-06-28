import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';

import '../model/article_model.dart';
import '../pages/favorite_page.dart';

class FavoriteIcon extends StatelessWidget {
  final Article? article;
  FavoriteIcon({super.key, this.article});
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    controller.isTabletView.value = isTablet;

    return Obx(
      () => IconButton(
        icon: article!.isFav.value
            ? Icon(
                Icons.favorite_rounded,
                size: isTablet ? 36.r : 24.0.r,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite_border,
                size: isTablet ? 36.r : 24.0.r,
              ),
        onPressed: () {
          article?.isFav.toggle();
          if (article!.isFav.value) {
            controller.addToCart(article!);
            isTablet
                ? Get.snackbar(
                    'Favorite Added',
                    '${article!.title} has been added to your favorite list.',
                    titleText: Text(
                      "Article Added to Favorite",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    messageText: Text(
                      '${article!.title} has been added to your favorite list.',
                      style: TextStyle(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    onTap: (snack) {
                      Get.off(
                        () => FavoritePage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(milliseconds: 800),
                      );
                    },
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                  )
                : Get.snackbar(
                    'Favorite Added',
                    '${article!.title} has been added to your favorite list.',
                    titleText: Text(
                      "Article Added to Favorite",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    onTap: (snack) {
                      Get.off(
                        () => FavoritePage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(milliseconds: 800),
                      );
                    },
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                  );
          } else {
            controller.removeFromCart(article!);
            isTablet
                ? Get.snackbar(
                    'Favorite Removed',
                    '${article!.title} has been added to your favorite list.',
                    titleText: Text(
                      "Article Added to Favorite",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    messageText: Text(
                      '${article!.title} has been removed from your favorite list.',
                      style: TextStyle(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    onTap: (snack) {
                      Get.off(
                        () => FavoritePage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(milliseconds: 800),
                      );
                    },
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                  )
                : Get.snackbar(
                    'Favorite Removed',
                    '${article!.title} has been removed from your favorite list.',
                    titleText: Text(
                      "Favorite Removed",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    onTap: (snack) {
                      Get.off(
                        () => FavoritePage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(milliseconds: 800),
                      );
                    },
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                  );
          }
        },
      ),
    );
  }
}
