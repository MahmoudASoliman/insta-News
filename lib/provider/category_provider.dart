import 'package:flutter/foundation.dart';

class CategoryProvider with ChangeNotifier {
  String _selectedCategory = 'general'; // Default category

  String get selectedCategory => _selectedCategory;

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
