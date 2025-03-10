import 'package:flutter/material.dart';
import 'package:ui_13/List_data/plant_model.dart';
import 'package:ui_13/const/color.dart';
import 'package:ui_13/List_data/plant_data.dart';
import 'package:ui_13/utils/app_data.dart';
import 'package:ui_13/Screen_page/payment_page.dart';
import 'package:ui_13/utils/toast_helper.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartPlants = plants.where((plant) => AppData.cartItems.contains(plant.id)).toList();

    final total = cartPlants.fold<double>(0, (sum, plant) => sum + plant.price);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: const Text(
          'Checkout',
          style: TextStyle(color: black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartPlants.length,
              itemBuilder: (context, index) {
                final plant = cartPlants[index];
                return CartItem(plant: plant);
              },
            ),
          ),
          Container(
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
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: cartPlants.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentPage(),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disabledBackgroundColor: grey.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Text(
                        cartPlants.isEmpty ? 'Cart is Empty' : 'Proceed to Payment',
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
}

class CartItem extends StatefulWidget {
  final Plants plant;

  const CartItem({Key? key, required this.plant}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.plant.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.plant.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${widget.plant.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            color: Colors.red,
            onPressed: () {
              AppData.removeFromCart(widget.plant.id);
              ToastHelper.showSuccess('Removed from cart');
              if (mounted) {
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
