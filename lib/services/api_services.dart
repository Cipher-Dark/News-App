import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/source_model.dart';

class ApiServices {
  String key = dotenv.get('apiKey');
  String baseUrl = 'https://newsapi.org/v2';

  Future<NewsModel> getTopHeadlines() async {
    String url = '$baseUrl/top-headlines?country=us&apiKey=$key';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top headliness');
    }
  }
}
