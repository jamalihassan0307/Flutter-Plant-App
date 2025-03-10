import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ui_13/const/color.dart';
import 'package:ui_13/widgets/bottom_nav.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur effect
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/Bush Plant.png'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          //     child: Container(
          //       color: white.withOpacity(0.7),
          //     ),
          //   ),
          // ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.08),

                  // Welcome text
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      '🌿 Welcome',
                      style: TextStyle(
                        color: green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Main title
                  const Text(
                    'Discover the\nBeauty of Plants',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      height: 1.2,
                      letterSpacing: 0.5,
                    ),
                  ),

                  SizedBox(height: 16),

                  // Subtitle
                  Text(
                    'Explore our collection of beautiful plants to bring nature into your home',
                    style: TextStyle(
                      fontSize: 16,
                      color: black.withOpacity(0.7),
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: size.height * 0.06),

                  // Plant image
                  Center(
                    child: Container(
                      height: size.height * 0.35,
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: green.withOpacity(0.3),
                            blurRadius: 90,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/images/small plant.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Spacer(),

                  // Buttons
                  Column(
                    children: [
                      // Get Started button
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => const BottomNavBar(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: green.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Sign In row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: black.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to login page
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
