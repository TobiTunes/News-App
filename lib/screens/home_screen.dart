import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/get_news_services.dart';
import 'package:news_app/widgets/tab_bar_widget.dart';
import '../models/news_article.dart';
import '../widgets/app_bar_widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  late TabController _tabController;

  GetNewsService getNewsService = GetNewsService();

  IconData icon = Icons.menu;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    getNewsService.getNewsFromApi().then((List<NewsArticle> newsArticles) {
      for (var article in newsArticles) {
        if (kDebugMode) {
          print('The start of the general news');
          print('Headline: ${article.headline}');
          print('Timestamp: ${article.timestamp}');
          print('Author: ${article.author}');
          print('Image URL: ${article.imageUrl}');
          print('---------------------------');
        }
      }
      return Future.value();
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });

    // getNewsService
    //     .getBusinessNewsFromApi()
    //     .then((List<NewsArticle> newsArticles) {
    //   for (var article in newsArticles) {
    //     if (kDebugMode) {
    //       print('The start of the business news');
    //       print('Headline: ${article.headline}');
    //       print('Timestamp: ${article.timestamp}');
    //       print('Author: ${article.author}');
    //       print('Image URL: ${article.imageUrl}');
    //       print('---------------------------');
    //     }
    //   }
    //   return Future.value();
    // }).onError((error, stackTrace) {
    //   if (kDebugMode) {
    //     print(error);
    //   }
    // });

    // getNewsService.getTechNewsFromApi().then((List<NewsArticle> newsArticles) {
    //   for (var article in newsArticles) {
    //     if (kDebugMode) {
    //       print('The start of the tech news');
    //       print('Headline: ${article.headline}');
    //       print('Timestamp: ${article.timestamp}');
    //       print('Author: ${article.author}');
    //       print('Image URL: ${article.imageUrl}');
    //       print('---------------------------');
    //     }
    //   }
    //   return Future.value();
    // }).onError((error, stackTrace) {
    //   if (kDebugMode) {
    //     print(error);
    //   }
    // });

    // getNewsService
    //     .getSportsNewsFromApi()
    //     .then((List<NewsArticle> newsArticles) {
    //   for (var article in newsArticles) {
    //     if (kDebugMode) {
    //       print('The start of the sports news');
    //       print('Headline: ${article.headline}');
    //       print('Timestamp: ${article.timestamp}');
    //       print('Author: ${article.author}');
    //       print('Image URL: ${article.imageUrl}');
    //       print('---------------------------');
    //     }
    //   }
    //   return Future.value();
    // }).onError((error, stackTrace) {
    //   if (kDebugMode) {
    //     print(error);
    //   }
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(_tabController, icon, true, context),
      body: MyTabBarView(
        tabController: _tabController,
      ),
    );
  }
}
