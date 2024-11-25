import 'package:flutter/material.dart';
import 'package:insta_news/models/catedory_model.dart';
import 'package:insta_news/widget/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryList = [
      CategoryModel(
          categoryImage: "assets/general.jpg",
          categoryType: "general",
          categoryName: "General"),
      CategoryModel(
        categoryImage: "assets/business.jpg",
        categoryType: "business",
        categoryName: "Business",
      ),
      CategoryModel(
        categoryImage: "assets/entertaiment.avif",
        categoryType: "club",
        categoryName: "Entertaiment",
      ),
      CategoryModel(
        categoryImage: "assets/health.avif",
        categoryType: "health",
        categoryName: "Health",
      ),
      CategoryModel(
        categoryImage: "assets/science.avif",
        categoryType: "science",
        categoryName: "Science",
      ),
      CategoryModel(
        categoryImage: "assets/technology.jpeg",
        categoryType: "Technology",
        categoryName: "Technology",
      ),
      CategoryModel(
        categoryImage: "assets/sports.jpg",
        categoryType: "football",
        categoryName: "Sprots",
      ),
    ];
    return ListView.builder(
      itemCount: categoryList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryCard(
          categoryModel: categoryList[index],
        );
      },
    );
  }
}
