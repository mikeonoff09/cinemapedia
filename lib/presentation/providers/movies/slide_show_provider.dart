import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final moviesProvider = ref.watch(nowPlayingMoviesProvider);
  if (moviesProvider.isEmpty) return [];
  if (moviesProvider.length > 6) {
    return moviesProvider.sublist(0, 6);
  }
  return moviesProvider;
});
