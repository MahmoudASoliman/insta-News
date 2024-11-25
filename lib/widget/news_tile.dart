import 'package:flutter/material.dart';

import 'package:insta_news/models/article_model.dart';
import 'package:insta_news/widget/image_builder.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel articleModel;
  const NewsTile({
    super.key,
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200, // Define a fixed height for the image container
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              child: ImageBuilder(articleModel: articleModel),
            ),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            articleModel.title ??
                "afdacsvfmfjmvnjnjfnshsbvhsbjnsfjnsvhsfbhvfsbjfvnjkkkkkjnjnjnjnjnjnjn",
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            articleModel.subTilte ??
                "afdacsvfmfjmvnjnjfnshsbvhsbjnsfjnsvhsfbhvfsbjfvnjjnjnjnjnjkjjjjjjjnjnsamnvfjmnvjlfanjnjn",
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
