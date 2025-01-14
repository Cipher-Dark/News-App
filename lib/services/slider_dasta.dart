import 'package:news_app/models/slider_model.dart';

List<SliderModel> getSliderData() {
  List<SliderModel> sliderData = <SliderModel>[];

  SliderModel sliderModel = SliderModel();
  sliderModel.title = "Business";
  sliderModel.image = "assets/images/buisness.jpeg";
  sliderData.add(sliderModel);

  sliderModel = SliderModel();
  sliderModel.title = "Entertainment";
  sliderModel.image = "assets/images/entertainment.jpeg";
  sliderData.add(sliderModel);

  sliderModel = SliderModel();
  sliderModel.title = "General";
  sliderModel.image = "assets/images/general.jpeg";
  sliderData.add(sliderModel);

  sliderModel = SliderModel();
  sliderModel.title = "Health";
  sliderModel.image = "assets/images/health.jpeg";
  sliderData.add(sliderModel);

  sliderModel = SliderModel();
  sliderModel.title = "Science";
  sliderModel.image = "assets/images/science.jpeg";
  sliderData.add(sliderModel);

  sliderModel = SliderModel();
  sliderModel.title = "Sports";
  sliderModel.image = "assets/images/sports.jpeg";
  sliderData.add(sliderModel);

  sliderModel = SliderModel();
  sliderModel.title = "Technology";
  sliderModel.image = "assets/images/technology.jpeg";
  sliderData.add(sliderModel);

  return sliderData;
}
