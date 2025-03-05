import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<String> favoritePlants;

  const FavoritesPage({Key? key, required this.favoritePlants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favoritePlants.isEmpty
          ? Center(child: Text('No favorite plants added yet.'))
          : ListView.builder(
              itemCount: favoritePlants.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoritePlants[index]),
                  // You can add more details or a navigation to the plant details page
                  onTap: () {
                    // Navigate to the plant details page if needed
                  },
                );
              },
            ),
    );
  }
} 