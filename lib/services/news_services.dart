import 'package:dio/dio.dart';
import 'package:insta_news/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService({
    required this.dio,
  });

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=$category&apiKey=bb225f45e28045e398d5615b5768311c&language=ar',
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;
        List<dynamic> articles = jsonData["articles"];
        List<ArticleModel> articlesList = [];

        for (var article in articles) {
          ArticleModel articleModel = ArticleModel.jsonData(article);
          // Ensure all required fields are valid strings
          if (articleModel.image is String &&
              articleModel.title is String &&
              articleModel.subTilte is String) {
            articlesList.add(articleModel);
          } else {
            // Handle the case where fields are invalid
            print('Invalid article data: $article');
          }
        }
        return articlesList;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } on Exception catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
