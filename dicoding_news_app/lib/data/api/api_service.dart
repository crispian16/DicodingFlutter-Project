import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dicoding_news_app/data/model/article.dart';

class ApiService {
  static final String _baseUrl = 'https://newsapi.org/v2/';
  static final String _apiKey = 'd0ef43b514654f2aa8b839670bc518d2';
  static final String _category = 'business';
  static final String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl +
        "top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
