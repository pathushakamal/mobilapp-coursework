import 'package:flutter/material.dart';
import 'package:bellefeed/utils/news_service.dart';
import 'package:bellefeed/widgets/NewsListWidget.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final NewsService newsService = NewsService();
  List<Map<String, dynamic>> searchResults = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(labelText: 'Search'),
              onChanged: (value) {
                searchNews();
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                searchNews();
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            if (isLoading)
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else if (searchResults.isNotEmpty)
              Expanded(
                child: NewsListWidget(newsList: searchResults),
              )
            else
              Expanded(
                child: Center(
                  child: Text('No results found'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> searchNews() async {
    try {
      setState(() {
        isLoading = true;
      });
      final result = await newsService.searchNews(searchController.text);
      setState(() {
        searchResults = result;
        isLoading = false;
      });
    } catch (error) {
      print('Error searching news: $error');
      setState(() {
        isLoading = false;
      });
    }
  }
}
