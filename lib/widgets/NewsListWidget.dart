import 'package:bellefeed/screens/IndividualNewsScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> newsList;

  NewsListWidget({required this.newsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        String title = newsList[index]['title'] ?? '';
        String imageUrl = newsList[index]['urlToImage'] ??
            'https://www.albertadoctors.org/images/ama-master/feature/Stock%20photos/News.jpg';
        String publishedAt = newsList[index]['publishedAt'] ?? '';
        DateTime parsedDate = DateTime.parse(publishedAt);
        String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

        return ListTile(
          contentPadding: EdgeInsets.all(16.0),
          leading: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    IndividualNewsScreen(newsItem: newsList[index]),
              ),
            );
          },
        );
      },
    );
  }
}
