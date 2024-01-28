import 'package:flutter/material.dart';
import 'package:bellefeed/screens/SearchScreen.dart';
import 'package:bellefeed/utils/news_service.dart';
import 'package:bellefeed/widgets/NewsListWidget.dart';
import 'package:bellefeed/widgets/TopNewsWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BelleFeed'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: newsService.fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting for the data
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Handle error state
              return Center(
                child: Text('Error fetching data'),
              );
            } else {
              // Data loaded successfully
              List<Map<String, dynamic>> newsList = snapshot.data!;
              List<Map<String, dynamic>> topNews = newsList.take(5).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopNewsWidget(topNews: topNews),
                  SizedBox(height: 20),
                  Text(
                    'Latest News',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: NewsListWidget(newsList: newsList),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
