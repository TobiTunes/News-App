import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/get_news_services.dart';

class GetBusinessNewsProvider extends ChangeNotifier {
  final getNewsService = GetNewsService();
  bool isLoading = false;

  List<NewsArticle> _newsarticles = [];
  List<NewsArticle> get news => _newsarticles;

  Future<void> getBusinessNews() async {
    isLoading = true;
    notifyListeners();

    final response = await getNewsService.getBusinessNewsFromApi();
    _newsarticles = response;
    isLoading = false;
    notifyListeners();
  }
}
