import 'package:flutter/material.dart';
import 'package:news_app/test/test_data.dart';

import '../models/news_article.dart';
import '../widgets/news_item_widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Widget'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}

TabBarView tabBarView(TabController tabController) {
  final List<NewsArticle> newsArticles = TestData().newsArticleTile;
  final List<NewsArticle> newsArticlesSports = TestDataSports().newsArticleTile;
  final List<NewsArticle> newsArticlesMusic = TestDataMusic().newsArticleTile;
  final List<NewsArticle> newsArticlesPolitics =
      TestDataPolitics().newsArticleTile;

  return TabBarView(controller: tabController, children: <Widget>[
    Center(
      child: ListView.builder(
        itemCount: newsArticles.length,
        itemBuilder: (context, index) {
          final article = newsArticles[index];
          return NewsItemWidget(article: article);
        },
      ),
    ),
    Center(
      child: ListView.builder(
        itemCount: newsArticlesSports.length,
        itemBuilder: (context, index) {
          final article = newsArticlesSports[index];
          return NewsItemWidget(article: article);
        },
      ),
    ),
    Center(
      child: ListView.builder(
        itemCount: newsArticlesMusic.length,
        itemBuilder: (context, index) {
          final article = newsArticlesMusic[index];
          return NewsItemWidget(article: article);
        },
      ),
    ),
    Center(
      child: ListView.builder(
        itemCount: newsArticlesPolitics.length,
        itemBuilder: (context, index) {
          final article = newsArticlesPolitics[index];
          return NewsItemWidget(article: article);
        },
      ),
    ),
  ]);
}
