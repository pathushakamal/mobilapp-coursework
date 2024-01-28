import 'package:flutter/material.dart';
import 'package:bellefeed/utils/category_service.dart';
import 'package:bellefeed/widgets/CategoryGridWidget.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryService categoryService = CategoryService();
  late Future<List<Category>> categories;

  @override
  void initState() {
    super.initState();
    categories = fetchCategories();
  }

  Future<List<Category>> fetchCategories() async {
    try {
      final result = await categoryService.fetchCategories();
      return result;
    } catch (error) {
      print('Error fetching categories: $error');
      throw error; // Rethrow the error to be caught by FutureBuilder
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Category>>(
          future: categories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting for the data
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Handle error state
              return Center(
                child: Text('Error fetching categories'),
              );
            } else {
              // Data loaded successfully
              return CategoryGridWidget(categories: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
