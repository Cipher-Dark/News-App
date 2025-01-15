import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildSlideImage(
  String? urlImage,
  String? title,
  int index,
  BuildContext context,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: urlImage ?? "https://fakeimg.pl/350x200/?text=Not%20Available",
            height: 250,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 160),
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.black45,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    ),
  );
}
