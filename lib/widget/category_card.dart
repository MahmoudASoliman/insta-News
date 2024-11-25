import 'package:flutter/material.dart';
import 'package:insta_news/models/catedory_model.dart';
import 'package:insta_news/provider/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final isSelected =
        categoryProvider.selectedCategory == categoryModel.categoryType;

    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: GestureDetector(
        onTap: () {
          categoryProvider.setCategory(categoryModel.categoryType);
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border:
                isSelected ? Border.all(color: Colors.blue, width: 3) : null,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                categoryModel.categoryImage,
              ),
            ),
          ),
          child: Center(
            child: Text(
              categoryModel.categoryName,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
