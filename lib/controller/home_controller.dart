import 'package:get/get.dart';
import 'package:news_app/services/slider_data.dart';

import '../model/slider_model.dart';

class HomeController extends GetxController {
  List<SliderModel> sliders = [];
  RxInt activeIndex = 0.obs;

  @override
  void onInit() {
    sliders = getSliders();
    super.onInit();
  }
}
