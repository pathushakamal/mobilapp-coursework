import 'package:bellefeed/utils/constants.dart';
import 'package:bellefeed/utils/web_client.dart';

class NewsService {
	final WebClient webClient = WebClient();

	Future<List<Map<String, dynamic>>> fetchNews() async {
		const url =
			'${Constants.baseUrl}/top-headlines?language=en&apiKey=${Constants.apiKey}';
		final result = await webClient.fetchData(url);
		return List<Map<String, dynamic>>.from(result['articles']);
	}

Future<dynamic> fetchCategoryNews(String category) async {
	final url = '${Constants.baseUrl}/top-headlines?category=$category&language=en&apiKey=${Constants.apiKey}';
	final result = await webClient.fetchData(url);
		return List<Map<String, dynamic>>.from(result['articles']);
}
	Future<List<Map<String, dynamic>>> searchNews(String query) async {
		final url =
			'${Constants.baseUrl}/everything?q=$query&apiKey=${Constants.apiKey}';
		final result = await webClient.fetchData(url);
		return List<Map<String, dynamic>>.from(result['articles']);
	}
}
