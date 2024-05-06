import 'dart:convert';
import 'package:http/http.dart' as http;

class PixabayService {
  static const String apiKey = '19638506-cdd7d461185a335a510193d37';
  static const String baseUrl = 'https://pixabay.com/api/';

  Future<List<Map<String, dynamic>>> fetchImages({
    String? query = '',
    String? language = 'en',
    String? imageType = 'all',
    String? orientation = 'all',
    String? category = '',
    int? minWidth = 0,
    int? minHeight = 0,
    String? colors = '',
    bool? editorsChoice = false,
    bool? safeSearch = false,
    String? order = 'popular',
    int? page = 1,
    int? perPage = 20,
  }) async {
    final Uri uri = Uri.parse(
      '$baseUrl?key=$apiKey'
          '&q=$query'
          '&lang=$language'
          '&image_type=$imageType'
          '&orientation=$orientation'
          '&category=$category'
          '&min_width=$minWidth'
          '&min_height=$minHeight'
          '&colors=$colors'
          '&editors_choice=${editorsChoice.toString()}'
          '&safesearch=${safeSearch.toString()}'
          '&order=$order'
          '&page=$page'
          '&per_page=$perPage',
    );

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['hits'];
      return data.cast<Map<String, dynamic>>().toList();
    } else {
      throw Exception('Failed to fetch images');
    }
  }
}
