import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'bold',
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "View all",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.blue, fontFamily: 'bold'),
            ),
          ),
        ],
      ),
    );
  }
}
