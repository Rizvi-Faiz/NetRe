import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String summary;
  final VoidCallback onTap;

  MovieCard({
    required this.title,
    this.imageUrl,
    required this.summary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: imageUrl != null
          ? Image.network(imageUrl!)
          : Icon(Icons.movie, size: 50),
      title: Text(title),
      subtitle: Text(
        summary.replaceAll(RegExp('<[^>]*>'), ''), // Strip HTML tags
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
