import 'package:flutter/material.dart';

class PlantDetailsPage extends StatelessWidget {
  final String plantName;

  const PlantDetailsPage({Key? key, required this.plantName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plantName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Details about $plantName',
              style: TextStyle(fontSize: 24),
            ),
            // Add more details and UI elements here
          ],
        ),
      ),
    );
  }
}
