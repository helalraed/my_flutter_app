class Movie {
  final String title;
  final String posterPath;
  final double rating;
  final String overview;

  Movie({
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'No Title',
      posterPath: json['poster_path'] ?? '',
      rating: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] ?? 'No description available.',
    );
  }
}

