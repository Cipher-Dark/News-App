import 'package:flutter/material.dart';
import 'package:news_app/screens/view_all/view_all_list.dart';

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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllList(category: title)));
            },
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
