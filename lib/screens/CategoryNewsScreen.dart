import 'package:flutter/material.dart';
import 'package:bellefeed/utils/news_service.dart';
import 'package:bellefeed/widgets/NewsListWidget.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String category;

  CategoryNewsScreen({required this.category});

  @override
  _CategoryNewsScreenState createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  final NewsService newsService = NewsService();
  List<Map<String, dynamic>> categoryNews = [];

  @override
  void initState() {
    super.initState();
    fetchCategoryNews();
  }

  Future<void> fetchCategoryNews() async {
    try {
      final result = await newsService.fetchCategoryNews(widget.category);
      setState(() {
        categoryNews = result;
      });
    } catch (error) {
      print('Error fetching category news: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NewsListWidget(newsList: categoryNews),
      ),
    );
  }
}
