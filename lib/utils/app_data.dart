class AppData {
  static List<int> favoritePlantIds = [];
  static List<int> cartItems = [];
  static double cartTotal = 0.0;

  static void toggleFavorite(int plantId) {
    if (favoritePlantIds.contains(plantId)) {
      favoritePlantIds.remove(plantId);
    } else {
      favoritePlantIds.add(plantId);
    }
  }

  static void addToCart(int plantId) {
    cartItems.add(plantId);
  }

  static void removeFromCart(int plantId) {
    cartItems.remove(plantId);
  }
} 