import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/details/details_screen.dart';
import 'package:news_app/services/api_services.dart';

class ViewAllList extends StatefulWidget {
  final String category;

  const ViewAllList({super.key, required this.category});

  @override
  State<ViewAllList> createState() => _ViewAllListState();
}

class _ViewAllListState extends State<ViewAllList> {
  late Future<NewsModel> viewAllFuture;
  @override
  void initState() {
    super.initState();
    if (widget.category == "Trending News") {
      viewAllFuture = ApiServices().getTopHeadlines();
    } else if (widget.category == "Breaking News") {
      viewAllFuture = ApiServices().getBreakingNews();
    } else {
      viewAllFuture = ApiServices().getCategory(widget.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'bold',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<NewsModel>(
          future: viewAllFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey[200],
                color: Colors.blue,
              ));
            } else if (snapshot.hasError) {
              log('Error is: ${snapshot.error}');
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.articles.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      data: data.articles[index],
                                    )));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 340,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: data!.articles[index].urlToImage ?? "https://fakeimg.pl/350x200/?text=Not%20Available",
                                height: 220,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              data.articles[index].title ?? "title",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'bold',
                              ),
                            ),
                            Text(
                              data.articles[index].description ?? "description",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'regular',
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }
}
