import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

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

  Future<NewsModel> getBreakingNews() async {
    String url = '$baseUrl/top-headlines?sources=techcrunch&apiKey=$key';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Breaking News');
    }
  }

  Future<NewsModel> getCategory(String category) async {
    String url = '$baseUrl/top-headlines?country=us&category=$category&apiKey=$key';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load the category $category');
    }
  }
}
