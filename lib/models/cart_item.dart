import 'food.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({required this.food, required this.selectedAddons, this.quantity = 1});

  double get totalPrice{
    double addonPrice = selectedAddons.fold(0, (sum, addons) => sum + addons.price);
    return (food.price + addonPrice) * quantity;
  }
}