import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/screens/details/details_screen.dart';

class TrendingTile extends StatelessWidget {
  const TrendingTile({
    super.key,
    required this.data,
  });

  final data;

  @override
  Widget build(BuildContext context) {
    if (data.title != '[Removed]' || data.urlToImage != null || data.title != "") {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        data: data,
                      )));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 6, top: 5),
                child: Row(
                  spacing: 10,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: data.urlToImage ?? "https://fakeimg.pl/350x200/?text=Not%20Available",
                        fit: BoxFit.fill,
                        height: 110,
                        width: 130,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            data.title ?? "",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'bold',
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            data.description ?? "",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'regular',
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
