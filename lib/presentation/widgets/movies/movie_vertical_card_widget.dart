import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieVerticalCardWidget extends StatelessWidget {
  const MovieVerticalCardWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 240,  // TODO: Refactor this
              width: 170,   // and this
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                      );
                    }
                    return FadeIn(child: child);
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star_half,
                  color: Colors.amber[400],
                ),
                Text(
                  movie.voteAverage.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[400],
                  ),
                ),
                const SizedBox(width: 8),
                Text(NumberFormat.compactCurrency(
                  decimalDigits: 2,
                  symbol: '',
                ).format(movie.voteCount))
              ],
            )
          ],
        ),
      ),
    );
  }
}
