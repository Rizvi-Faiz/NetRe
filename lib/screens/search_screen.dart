import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/movie_card.dart'; // Assuming MovieCard widget is used
import 'details_screen.dart'; // Import DetailsScreen

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List searchResults = [];
  final TextEditingController searchController = TextEditingController();

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    if (response.statusCode == 200) {
      List decodedResults = jsonDecode(response.body);
      List validResults = decodedResults.where((movie) {
        // Check if the movie has necessary fields
        return movie['show'] != null &&
            movie['show']['name'] != null &&
            movie['show']['image'] != null &&
            movie['show']['image']['medium'] != null;
      }).toList();

      setState(() {
        searchResults = validResults;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Move the search bar down using padding
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0), // Adjust top padding
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search movies...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            onSubmitted: searchMovies,
          ),
        ),
        Expanded(
          child: searchResults.isEmpty
              ? const Center(child: Text('Search for movies'))
              : ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final movie = searchResults[index]['show'];
              return MovieCard(
                title: movie['name'],
                imageUrl: movie['image']?['medium'] ?? 'https://via.placeholder.com/150',
                summary: movie['summary'] ?? 'No description available',
                onTap: () {
                  // Navigate to details screen and pass movie data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(movie: movie),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
