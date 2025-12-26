//food items
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategories category;
  List<Addon> availableAddons;

  Food({required this.name, required this.price, required this.description, required this.imagePath, required this.category, required this.availableAddons});
}

// food categories
enum FoodCategories{
  burgers,
  pizzas,
  desserts,
  drinks,
}

//food addons
class Addon{
  String name;
  double price;

  Addon({required this.name, required this.price});
}