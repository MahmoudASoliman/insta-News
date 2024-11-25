import 'package:flutter/material.dart';
import 'package:insta_news/widget/category_list.dart';
import 'package:insta_news/widget/newslistvies_builder.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            text: 'Insta',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'News',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: CategoryList(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            NewsListViewBuilder()
          ],
        ),
      ),
    );
  }
}
