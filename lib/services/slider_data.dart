import '../model/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> sliders = [];
  SliderModel model1 = SliderModel();

  model1.image = "assets/1.jpg";
  model1.name = "This is the new title for first image.";
  sliders.add(model1);

  SliderModel model2 = SliderModel();
  model2.image = "assets/1.jpg";
  model2.name = "This is the new title for first image.";
  sliders.add(model2);

  SliderModel model3 = SliderModel();
  model3.image = "assets/logo.png";
  model3.name = "This is the new title for first image.";
  sliders.add(model3);

  SliderModel model4 = SliderModel();
  model4.image = "assets/logo.png";
  model4.name =
      "This is the new title for first image. This is the new title for first image. This is the new title for first image.";
  sliders.add(model4);

  return sliders;
}
