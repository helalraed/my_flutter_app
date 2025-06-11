
import 'package:flutter/material.dart';
import 'components/custom_image.dart';
import 'movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieTile({Key? key, required this.movie, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomImage(
              imageUrl: movie.posterPath,
              height: 126,
              width: 165.5,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 165.5,
            height: 42,
            padding: EdgeInsets.all(8),
            child: Text(
              movie.overview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.2,
                color: Color(0xFF939393),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
