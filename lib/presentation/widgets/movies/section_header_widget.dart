import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: textTheme.titleLarge,
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: colors.secondary,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4,
                ),
                child: Text(
                  subtitle,
                  style: TextStyle(color: colors.onSecondary),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
