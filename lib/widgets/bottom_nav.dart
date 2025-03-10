import 'package:flutter/material.dart';
import 'package:ui_13/const/color.dart';
import 'package:ui_13/List_data/bottom_menu.dart';
import 'package:ui_13/Screen_page/home_page.dart';
import 'package:ui_13/Screen_page/plant_details_page.dart';
import 'package:ui_13/Screen_page/favorites_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController();
  int selectIndex = 0;

  // Sample list of favorite plants
  List<String> favoritePlants = ['Aloe Vera', 'Snake Plant'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: child.length,
        controller: pageController,
        onPageChanged: (value) => setState(() => selectIndex = value),
        itemBuilder: (itemBuilder, index) {
          return Container(
            child: child[index],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; bottomMenu.length > i; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(i);
                      selectIndex = i;
                    });
                  },
                  child: Image.asset(
                    bottomMenu[i].imagePath,
                    color: selectIndex == i ? green : grey.withOpacity(0.5),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> child = [
  const HomePage(),
  const PlantDetailsPage(
    plantName: 'Aloe Vera',
    plantImage: 'assets/images/aloe_vera.png',
    plantDescription:
        'Aloe Vera is a succulent plant species of the genus Aloe. It is widely distributed and cultivated for commercial products, mainly as a topical treatment.',
  ),
  const FavoritesPage(),
  Container(color: white),
  Container(color: white),
];
