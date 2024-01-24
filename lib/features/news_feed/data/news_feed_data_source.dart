import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsFeedDataSource {
  Future<Map<String, dynamic>?> fetchNews(int pageNo) async {
    final Uri? uri =
        Uri.tryParse('https://dev.coincrowd.com/api/crypto-news/?page=$pageNo');
    if (uri == null) return null;
    final response = await http.get(uri);
    return jsonDecode(response.body);
  }
}
