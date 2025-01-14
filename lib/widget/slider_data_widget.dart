import 'package:flutter/material.dart';

Widget buildSlideImage(
  String urlImage,
  String title,
  int index,
  BuildContext context,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            height: 250,
            urlImage,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 180),
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.black45,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    ),
  );
}
