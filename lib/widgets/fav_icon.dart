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
    return Obx(
      () => IconButton(
        icon: article!.isFav.value
            ? Icon(
                Icons.favorite_rounded,
                size: 24.0.r,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite_border,
                size: 24.0.r,
              ),
        onPressed: () {
          article?.isFav.toggle();
          if (article!.isFav.value) {
            controller.addToCart(article!);
            Get.snackbar(
              'Favorite Added',
              '${article!.title} has been added to your favorite list.',
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
            Get.snackbar(
              'Favorite Removed',
              '${article!.title} has been removed from your favorite list.',
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
