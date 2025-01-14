import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/services/category_data.dart';
import 'package:news_app/services/slider_dasta.dart';
import 'package:news_app/widget/slider_data_widget.dart';
import 'package:news_app/widget/title_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  int activeIndex = 0;
  @override
  void initState() {
    categories = getCategories();
    sliders = getSliderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.deepPurple[200],
        title: const Text('News App'),
        centerTitle: true,
      ),
      body: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 70,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryTile(
                  title: categories[index].title!,
                  imageUrl: categories[index].image!,
                );
              },
            ),
          ),
          TitleWidget(
            title: "Breaking News",
          ),
          CarouselSlider.builder(
            itemCount: sliders.length,
            itemBuilder: (context, index, realIndex) {
              return buildSlideImage(
                sliders[index].image!,
                sliders[index].title!,
                index,
                context,
              );
            },
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: sliders.length,
              effect: WormEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Colors.deepPurple,
                dotColor: Colors.grey,
              ),
            ),
          ),
          TitleWidget(
            title: "Trending News",
          ),
        ],
      ),
    );
  }
}
