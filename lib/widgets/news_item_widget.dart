import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:news_app/models/news_article.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsArticle article;
  const NewsItemWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    // String timeStamp = DateFormat.Hm().format(article.timestamp);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              article.imageUrl!,
              fit: BoxFit.cover,
              width: 100,
              height: 80,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset('assets/testImg.jpg'),
            ),
            // Image(
            //     image: NetworkImage(article.imageUrl!),
            //     fit: BoxFit.cover,
            //     width: 100,
            //     height: 80),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5, top: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(article.headline ?? '--',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(article.timestamp ?? 'Not available'),
                    ]),
              ),
            )
          ]),
    );
  }
}
