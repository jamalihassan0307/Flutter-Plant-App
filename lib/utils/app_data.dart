class AppData {
  static List<int> favoritePlantIds = [];
  static List<int> cartItems = [];
  static double cartTotal = 0.0;
  static bool isLoggedIn = false;
  static String currentUser = '';

  static void toggleFavorite(int plantId) {
    if (favoritePlantIds.contains(plantId)) {
      favoritePlantIds.remove(plantId);
    } else {
      favoritePlantIds.add(plantId);
    }
  }

  static void addToCart(int plantId) {
    if (!cartItems.contains(plantId)) {
      cartItems.add(plantId);
      updateCartTotal();
    }
  }

  static void removeFromCart(int plantId) {
    cartItems.remove(plantId);
    updateCartTotal();
  }

  static void updateCartTotal() {
    cartTotal = 0.0;
    for (var plantId in cartItems) {
      final plant = plants.firstWhere((p) => p.id == plantId);
      cartTotal += plant.price;
    }
  }

  static void clearCart() {
    cartItems.clear();
    cartTotal = 0.0;
  }

  static void login(String username) {
    isLoggedIn = true;
    currentUser = username;
  }

  static void logout() {
    isLoggedIn = false;
    currentUser = '';
    clearCart();
    favoritePlantIds.clear();
  }
} 