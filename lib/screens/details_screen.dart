import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    final double rating = movie['rating']?['average']?.toDouble() ?? 0.0;
    final List genres = movie['genres'] ?? [];
    final String releaseYear = movie['premiered']?.substring(0, 4) ?? 'N/A';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          movie['name'] ?? 'Movie Name',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster (Full image)
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    movie['image']?['original'] ??
                        'https://via.placeholder.com/500',
                  ),
                  fit: BoxFit.contain, // Ensure the full image is shown
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Movie Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                movie['name'] ?? 'No title available',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Rating Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    rating > 0 ? '$rating/10' : 'No rating available',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Genres
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: genres.isEmpty
                    ? [
                  Text(
                    'No genres available',
                    style: TextStyle(color: Colors.white70),
                  )
                ]
                    : genres.map<Widget>((genre) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Chip(
                      label: Text(
                        genre,
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
            // Release Year
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Release Year: $releaseYear',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),
            SizedBox(height: 20),
            // Movie Summary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Summary: ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                movie['summary']?.replaceAll(RegExp('<[^>]*>'), '') ??
                    'No summary available.',
                style: TextStyle(fontSize: 16, color: Colors.white70),
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
              ),
            ),
            SizedBox(height: 20),
            // Additional sections can be added like Cast or Similar Shows
          ],
        ),
      ),
    );
  }
}
