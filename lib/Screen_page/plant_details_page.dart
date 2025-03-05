import 'package:flutter/material.dart';

class PlantDetailsPage extends StatelessWidget {
  final String plantName;
  final String plantImage;
  final String plantDescription;

  const PlantDetailsPage({
    Key? key,
    required this.plantName,
    required this.plantImage,
    required this.plantDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              plantImage,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                plantName,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                plantDescription,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to add to favorites
              },
              child: Text('Add to Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
