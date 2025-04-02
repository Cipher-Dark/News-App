import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class DetailsScreen extends StatefulWidget {
  final Article data;
  const DetailsScreen({
    super.key,
    required this.data,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var data = widget.data;
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  data.title ?? "",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'bold',
                  ),
                  textAlign: TextAlign.left,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Author: ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'bold',
                    ),
                    children: [
                      TextSpan(
                        text: data.author,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'normal',
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Source : ${data.source?.name ?? "Forbs"}",
                    ),
                    Text(
                      "Publish Date: ${data.publishedAt ?? "2022-01-01"}",
                    ),
                  ],
                ),
                CachedNetworkImage(
                  imageUrl: data.urlToImage ?? "https://fakeimg.pl/350x200/?text=Not%20Available",
                  fit: BoxFit.cover,
                ),
                Text(
                  data.content ?? data.description ?? "",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'normal',
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
