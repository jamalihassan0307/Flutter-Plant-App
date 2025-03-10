import 'package:ui_13/List_data/plant_data.dart';

class AppData {
  static List<int> favoritePlantIds = [];
  static bool isLoggedIn = false;
  static String currentUser = '';

  static void toggleFavorite(int plantId) {
    if (favoritePlantIds.contains(plantId)) {
      favoritePlantIds.remove(plantId);
    } else {
      favoritePlantIds.add(plantId);
    }
  }

  static void login(String username) {
    isLoggedIn = true;
    currentUser = username;
  }

  static void logout() {
    isLoggedIn = false;
    currentUser = '';
    favoritePlantIds.clear();
  }
}
