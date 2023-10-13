import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final slideshowProvider = ref.watch(moviesSlideshowProvider);
    final nowPlayingProvider = ref.watch(nowPlayingMoviesProvider);
    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlideshow(movies: slideshowProvider),
        MoviesHorizontalListView(
          movies: nowPlayingProvider,
          title: "En cines",
          subtitle: "Lunes 20",
        ),
      ],
    );
  }
}
