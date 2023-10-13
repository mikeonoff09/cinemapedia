import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_vertical_card_widget.dart';
import 'package:cinemapedia/presentation/widgets/movies/section_header_widget.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String title;
  final String subtitle;
  const MoviesHorizontalListView({
    super.key,
    required this.movies,
    this.title = '',
    this.subtitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          SectionHeaderWidget(title: title, subtitle: subtitle),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieVerticalCardWidget(movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}
