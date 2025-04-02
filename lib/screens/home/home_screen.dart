import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/details/details_screen.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/services/category_data.dart';
import 'package:news_app/widget/slider_data_widget.dart';
import 'package:news_app/widget/title_widget.dart';
import 'package:news_app/widget/trending_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  late Future<NewsModel> trendingFuture;
  late Future<NewsModel> breakingNewsFuture;
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    breakingNewsFuture = ApiServices().getBreakingNews();
    trendingFuture = ApiServices().getTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'bold',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              height: 70,
              // for the category list (horizontally)
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
            // for custom titles(breaking and trending)
            TitleWidget(
              title: "Breaking News",
            ),
            // for the carousel
            FutureBuilder(
              future: breakingNewsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  log('Error is: ${snapshot.error}');
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data != null) {
                  var data = snapshot.data;
                  var slidersData = data!.articles;

                  return CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                data: slidersData[index],
                              ),
                            ),
                          );
                        },
                        // for custom slider image and title
                        child: buildSlideImage(
                          slidersData[index].urlToImage!,
                          slidersData[index].title!,
                          index,
                          context,
                        ),
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
                          //update the index of the indicaters below this
                          activeIndex = index;
                        });
                      },
                    ),
                  );
                } else {
                  return Center(child: Text('No data available.'));
                }
              },
            ),
            // for the indicaters
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: 5,
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
            // for the bottom trending only show 6 items
            FutureBuilder<NewsModel>(
              future: trendingFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  log('Error is: ${snapshot.error}');
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data != null) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        var data = snapshot.data;

                        return TrendingTile(data: data!.articles[index]);
                      });
                } else {
                  return Center(child: Text('No data available.'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
