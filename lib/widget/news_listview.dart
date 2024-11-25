import 'package:flutter/material.dart';

import 'package:insta_news/models/article_model.dart';

import 'package:insta_news/widget/news_tile.dart';

class NewsListview extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListview({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return NewsTile(
            articleModel: articles[index],
          );
        },
        childCount: articles.length,
      ),
    );
  }
}
