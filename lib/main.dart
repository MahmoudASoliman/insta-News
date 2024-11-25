import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insta_news/pages/news_page.dart';
import 'package:insta_news/provider/category_provider.dart';
import 'package:provider/provider.dart';

//import 'package:http/http.dart' as http;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: const InstNews(),
    ),
  );
}

// void getNews() async {
//   try {
//     final response = await http.get(Uri.parse(
//         "https://newsapi.org/v2/everything?q=bitcoin&apiKey=bb225f45e28045e398d5615b5768311c"));
//     print(response.body);1
//   } catch (e) {
//     print("******************Error occurred: $e");
//   }
// }

void getNews() async {
  final dio = Dio();
  try {
    print("object****/*//");
    final response = await dio.get(
        "http://api.weatherapi.com/v1/current.json?key=ca9d15ad19714bb48e6114633230906&q=London&aqi=no");

    print(response.data);
    Map<String, dynamic> jsondata = response.data;
    print(
        "***********************************************************************____________*********");
    print(jsondata);
  } catch (e) {
    print("******************Error occurred: $e");
  }
}

class InstNews extends StatelessWidget {
  const InstNews({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}
