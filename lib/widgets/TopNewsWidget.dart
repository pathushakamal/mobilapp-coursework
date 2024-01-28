import 'package:bellefeed/screens/IndividualNewsScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TopNewsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> topNews;

  TopNewsWidget({required this.topNews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top News',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        CarouselSlider.builder(
          itemCount: topNews.length,
          options: CarouselOptions(
            height: 200.0,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
          ),
          itemBuilder: (context, index, realIndex) {
            List<String> words = topNews[index]['title'].toString().split(' ');
            String title = words.take(5).join(' ');

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        IndividualNewsScreen(newsItem: topNews[index]),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(topNews[index]['urlToImage'] ??
                        'https://www.albertadoctors.org/images/ama-master/feature/Stock%20photos/News.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
