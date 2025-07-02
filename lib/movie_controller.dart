import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie.dart';

class MovieController extends GetxController {
  var movies = <Movie>[].obs;
  var isLoading = true.obs;

  final String apiKey = 'da08abdd06e927429a4b005c832763dd';

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  Future<void> fetchMovies() async {
    isLoading(true);
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List results = data['results'];
        movies.value = results.map((m) => Movie.fromJson(m)).toList();
      } else {
        print('Error fetching movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
