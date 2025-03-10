import 'package:flutter/material.dart';
import 'package:ui_13/List_data/plant_model.dart';
import 'package:ui_13/const/color.dart';
import 'package:ui_13/utils/app_data.dart';
import 'package:ui_13/utils/toast_helper.dart';

class DetailsPage extends StatelessWidget {
  final Plants plant;
  const DetailsPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          // Plant Image
          Container(
            height: size.height * 0.5,
            decoration: BoxDecoration(
              color: lightGreen,
              image: DecorationImage(
                image: AssetImage(plant.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.45),
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(0.1),
                        blurRadius: 30,
                        offset: const Offset(0, -15),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plant.name,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  plant.category,
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$${plant.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: green,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Plant Care',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildCareItem(
                              icon: Icons.water_drop_outlined,
                              label: 'Water',
                              value: '250ml',
                            ),
                            _buildCareItem(
                              icon: Icons.thermostat_outlined,
                              label: 'Temp',
                              value: '20°C',
                            ),
                            _buildCareItem(
                              icon: Icons.wb_sunny_outlined,
                              label: 'Light',
                              value: 'Direct',
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          plant.description,
                          style: TextStyle(
                            color: grey,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Top buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildCircleButton(
                    icon: Icons.favorite,
                    onTap: () {
                      AppData.toggleFavorite(plant.id);
                      ToastHelper.showSuccess(AppData.favoritePlantIds.contains(plant.id)
                          ? 'Added to favorites'
                          : 'Removed from favorites');
                    },
                    isActive: AppData.favoritePlantIds.contains(plant.id),
                  ),
                ],
              ),
            ),
          ),

          // Bottom buttons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (!AppData.cartItems.contains(plant.id)) {
                          AppData.addToCart(plant.id);
                          ToastHelper.showSuccess('Added to cart');
                        } else {
                          ToastHelper.showError('Already in cart');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        AppData.cartItems.contains(plant.id)
                            ? 'In Cart'
                            : 'Add to Cart - \$${plant.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: green),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: isActive ? green : black,
        ),
      ),
    );
  }
}
