import 'package:flutter/material.dart';
import 'package:ui_13/const/color.dart';

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
      backgroundColor: white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: green,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                plantName,
                style: const TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    plantImage,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          black.withOpacity(0),
                          black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    plantDescription,
                    style: TextStyle(
                      fontSize: 16,
                      color: grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Care Instructions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCareInstructions(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add to favorites functionality
        },
        backgroundColor: green,
        icon: const Icon(Icons.favorite_border),
        label: const Text('Add to Favorites'),
      ),
    );
  }

  Widget _buildCareInstructions() {
    return Column(
      children: [
        _buildCareItem(
          icon: Icons.wb_sunny_outlined,
          title: 'Sunlight',
          description: 'Requires bright, indirect sunlight',
        ),
        _buildCareItem(
          icon: Icons.water_drop_outlined,
          title: 'Watering',
          description: 'Water when top soil feels dry',
        ),
        _buildCareItem(
          icon: Icons.thermostat_outlined,
          title: 'Temperature',
          description: 'Prefers 18-24°C (65-75°F)',
        ),
      ],
    );
  }

  Widget _buildCareItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: green),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
