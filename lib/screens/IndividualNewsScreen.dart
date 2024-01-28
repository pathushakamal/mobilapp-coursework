import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IndividualNewsScreen extends StatelessWidget {
  final Map<String, dynamic> newsItem;

  IndividualNewsScreen({required this.newsItem});

  @override
  Widget build(BuildContext context) {
    String title = newsItem['title'] ?? '';
    String imageUrl = newsItem['urlToImage'] ?? '';
    String publishedAt = newsItem['publishedAt'] ?? '';
    String content = newsItem['content'] ?? '';
    String author = newsItem['author'] ?? '';

    DateTime parsedDate = DateTime.parse(publishedAt);
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News image
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: imageUrl.isNotEmpty
                      ? NetworkImage(imageUrl)
                      : NetworkImage(
                          'https://www.albertadoctors.org/images/ama-master/feature/Stock%20photos/News.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // News title
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  author,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              content,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
