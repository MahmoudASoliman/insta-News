import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insta_news/models/article_model.dart';
import 'package:insta_news/provider/category_provider.dart';
import 'package:insta_news/services/news_services.dart';
import 'package:insta_news/widget/news_listview.dart';
import 'package:provider/provider.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListviewState();
}

class _NewsListviewState extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> future;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final category = Provider.of<CategoryProvider>(context).selectedCategory;
    future = NewsService(dio: Dio()).getNews(category: category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                "Error loading news",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return NewsListview(articles: snapshot.data!);
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                "No articles found",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
