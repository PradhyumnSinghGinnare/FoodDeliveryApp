import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{
  //list of food menu
  final List<Food> _menu = [

    // 🍔 Burgers & French Fries
    Food(
      name: 'Classic Veg Burger',
      price: 120,
      description: 'Crispy veg patty with fresh lettuce and creamy mayo.',
      imagePath: 'lib/images/burgers/1.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Extra Patty", price: 50),
        Addon(name: "Jalapenos", price: 25),
        Addon(name: "Cheese Slice", price: 20),
        Addon(name: "Spicy Sauce", price: 15),
      ],
    ),

    Food(
      name: 'Cheese Burst Burger',
      price: 160,
      description: 'Soft bun loaded with molten cheese and veg patty.',
      imagePath: 'lib/images/burgers/2.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 40),
        Addon(name: "Extra Patty", price: 50),
        Addon(name: "Cheese Slice", price: 25),
        Addon(name: "Butter Toasted Bun", price: 20),
        Addon(name: "Spicy Mayo", price: 15),
      ],
    ),

    Food(
      name: 'Spicy Paneer Burger',
      price: 170,
      description: 'Spicy paneer patty with tangy sauce.',
      imagePath: 'lib/images/burgers/3.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Paneer", price: 60),
        Addon(name: "Extra Cheese", price: 35),
        Addon(name: "Jalapenos", price: 25),
        Addon(name: "Chipotle Sauce", price: 20),
        Addon(name: "Onion Rings", price: 30),
      ],
    ),

    Food(
      name: 'Classic French Fries',
      price: 90,
      description: 'Golden crispy salted fries.',
      imagePath: 'lib/images/burgers/4.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Cheese Dip", price: 30),
        Addon(name: "Peri Peri Masala", price: 20),
        Addon(name: "Mayonnaise Dip", price: 25),
        Addon(name: "Extra Fries", price: 40),
        Addon(name: "Garlic Powder", price: 15),
      ],
    ),

    Food(
      name: 'Peri Peri Fries',
      price: 120,
      description: 'Crispy fries tossed in peri peri spice.',
      imagePath: 'lib/images/burgers/5.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Cheese Dip", price: 30),
        Addon(name: "Extra Peri Peri", price: 20),
        Addon(name: "Garlic Mayo", price: 25),
        Addon(name: "Extra Fries", price: 40),
        Addon(name: "Chilli Flakes", price: 15),
      ],
    ),

    Food(
      name: 'Loaded Cheese Fries',
      price: 160,
      description: 'Fries topped with melted cheese and herbs.',
      imagePath: 'lib/images/burgers/6.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 40),
        Addon(name: "Jalapenos", price: 25),
        Addon(name: "Olives", price: 30),
        Addon(name: "Chipotle Sauce", price: 20),
        Addon(name: "Extra Fries", price: 45),
      ],
    ),

    Food(
      name: 'Double Patty Burger',
      price: 210,
      description: 'Two juicy patties with cheese and sauce.',
      imagePath: 'lib/images/burgers/7.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Patty", price: 60),
        Addon(name: "Extra Cheese", price: 40),
        Addon(name: "Cheese Slice", price: 25),
        Addon(name: "BBQ Sauce", price: 20),
        Addon(name: "Onion Rings", price: 30),
      ],
    ),

    Food(
      name: 'Mexican Burger',
      price: 180,
      description: 'Mexican-style burger with spicy salsa.',
      imagePath: 'lib/images/burgers/8.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Jalapenos", price: 25),
        Addon(name: "Extra Cheese", price: 35),
        Addon(name: "Mexican Salsa", price: 20),
        Addon(name: "Nachos", price: 40),
        Addon(name: "Spicy Mayo", price: 15),
      ],
    ),

    Food(
      name: 'Cheesy Garlic Fries',
      price: 140,
      description: 'Garlic flavored fries with cheese.',
      imagePath: 'lib/images/burgers/9.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Garlic Dip", price: 25),
        Addon(name: "Chilli Flakes", price: 15),
        Addon(name: "Extra Fries", price: 40),
        Addon(name: "Herb Mix", price: 20),
      ],
    ),

    Food(
      name: 'Cafe Special Burger',
      price: 220,
      description: 'House special burger with signature sauce.',
      imagePath: 'lib/images/burgers/10.png',
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 40),
        Addon(name: "Extra Patty", price: 60),
        Addon(name: "Signature Sauce", price: 25),
        Addon(name: "Cheese Slice", price: 25),
        Addon(name: "Onion Rings", price: 30),
      ],
    ),

    // 🍕 Pizza
    Food(
      name: 'Margherita Pizza',
      price: 199,
      description: 'Classic cheese and tomato pizza.',
      imagePath: 'lib/images/pizza/1.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 50),
        Addon(name: "Olives", price: 30),
        Addon(name: "Jalapenos", price: 30),
        Addon(name: "Extra Cheese Burst", price: 70),
        Addon(name: "Italian Herbs", price: 20),
      ],
    ),

    Food(
      name: 'Farmhouse Pizza',
      price: 249,
      description: 'Loaded with fresh veggies and cheese.',
      imagePath: 'lib/images/pizza/2.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 50),
        Addon(name: "Mushrooms", price: 40),
        Addon(name: "Sweet Corn", price: 35),
        Addon(name: "Black Olives", price: 30),
        Addon(name: "Cheese Burst Crust", price: 80),
      ],
    ),

    Food(
      name: 'Paneer Tikka Pizza',
      price: 279,
      description: 'Spicy paneer tikka with cheese.',
      imagePath: 'lib/images/pizza/3.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Extra Paneer", price: 60),
        Addon(name: "Extra Cheese", price: 50),
        Addon(name: "Onions", price: 25),
        Addon(name: "Capsicum", price: 25),
        Addon(name: "Cheese Burst Crust", price: 80),
      ],
    ),

    Food(
      name: 'Cheese Burst Pizza',
      price: 299,
      description: 'Cheese-filled crust pizza.',
      imagePath: 'lib/images/pizza/4.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 60),
        Addon(name: "Jalapenos", price: 30),
        Addon(name: "Olives", price: 30),
        Addon(name: "Mushrooms", price: 40),
        Addon(name: "Italian Seasoning", price: 20),
      ],
    ),

    Food(
      name: 'Mexican Green Wave',
      price: 269,
      description: 'Spicy Mexican flavors with veggies.',
      imagePath: 'lib/images/pizza/5.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Jalapenos", price: 30),
        Addon(name: "Extra Cheese", price: 50),
        Addon(name: "Mexican Salsa", price: 35),
        Addon(name: "Capsicum", price: 25),
        Addon(name: "Cheese Burst Crust", price: 80),
      ],
    ),

    Food(
      name: 'BBQ Paneer Pizza',
      price: 289,
      description: 'Smoky BBQ sauce with paneer cubes and cheese.',
      imagePath: 'lib/images/pizza/6.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 50),
        Addon(name: "Extra Paneer", price: 60),
        Addon(name: "BBQ Sauce", price: 30),
        Addon(name: "Onions", price: 25),
        Addon(name: "Cheese Burst Crust", price: 80),
      ],
    ),

    Food(
      name: 'Pepper Corn Pizza',
      price: 259,
      description: 'Crunchy pepper corn with cheesy base.',
      imagePath: 'lib/images/pizza/7.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 50),
        Addon(name: "Black Pepper", price: 20),
        Addon(name: "Mushrooms", price: 40),
        Addon(name: "Olives", price: 30),
        Addon(name: "Cheese Burst Crust", price: 80),
      ],
    ),

    Food(
      name: 'Italian Veg Delight',
      price: 269,
      description: 'Italian herbs with olives, capsicum and cheese.',
      imagePath: 'lib/images/pizza/8.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Olives", price: 30),
        Addon(name: "Extra Cheese", price: 50),
        Addon(name: "Mushrooms", price: 40),
        Addon(name: "Italian Herbs", price: 20),
        Addon(name: "Cheese Burst Crust", price: 80),
      ],
    ),

    Food(
      name: 'Spicy Jalapeno Pizza',
      price: 249,
      description: 'Hot jalapenos with spicy sauce and cheese.',
      imagePath: 'lib/images/pizza/9.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Extra Jalapenos", price: 30),
        Addon(name: "Extra Cheese", price: 50),
        Addon(name: "Red Paprika", price: 25),
        Addon(name: "Onions", price: 25),
        Addon(name: "Cheese Burst Crust", price: 80),
      ],
    ),

    Food(
      name: 'Four Cheese Pizza',
      price: 319,
      description: 'Loaded with four types of premium cheese.',
      imagePath: 'lib/images/pizza/10.png',
      category: FoodCategories.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 60),
        Addon(name: "Cheese Burst Crust", price: 90),
        Addon(name: "Olives", price: 30),
        Addon(name: "Mushrooms", price: 40),
        Addon(name: "Italian Seasoning", price: 20),
      ],
    ),

    // 🍰 Desserts
    Food(
      name: 'Chocolate Brownie',
      price: 120,
      description: 'Soft chocolate brownie.',
      imagePath: 'lib/images/desserts/1.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream Scoop", price: 40),
        Addon(name: "Extra Chocolate Sauce", price: 25),
        Addon(name: "Choco Chips", price: 20),
        Addon(name: "Whipped Cream", price: 20),
        Addon(name: "Walnut Topping", price: 30),
      ],
    ),

    Food(
      name: 'Choco Lava Cake',
      price: 140,
      description: 'Warm cake with molten chocolate.',
      imagePath: 'lib/images/desserts/2.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream Scoop", price: 40),
        Addon(name: "Extra Chocolate Filling", price: 30),
        Addon(name: "Choco Syrup", price: 25),
        Addon(name: "Whipped Cream", price: 20),
        Addon(name: "Choco Chips", price: 20),
      ],
    ),

    Food(
      name: 'Vanilla Ice Cream',
      price: 90,
      description: 'Classic vanilla ice cream.',
      imagePath: 'lib/images/desserts/3.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Chocolate Syrup", price: 20),
        Addon(name: "Strawberry Syrup", price: 20),
        Addon(name: "Extra Scoop", price: 40),
        Addon(name: "Sprinkles", price: 15),
        Addon(name: "Choco Chips", price: 20),
      ],
    ),

    Food(
      name: 'Strawberry Sundae',
      price: 130,
      description: 'Ice cream topped with strawberry sauce.',
      imagePath: 'lib/images/desserts/4.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Extra Scoop", price: 40),
        Addon(name: "Chocolate Syrup", price: 25),
        Addon(name: "Fresh Strawberries", price: 30),
        Addon(name: "Whipped Cream", price: 20),
        Addon(name: "Sprinkles", price: 15),
      ],
    ),

    Food(
      name: 'Cheesecake',
      price: 180,
      description: 'Creamy baked cheesecake.',
      imagePath: 'lib/images/desserts/5.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Blueberry Topping", price: 30),
        Addon(name: "Strawberry Topping", price: 30),
        Addon(name: "Chocolate Drizzle", price: 25),
        Addon(name: "Whipped Cream", price: 20),
        Addon(name: "Extra Cheese Layer", price: 40),
      ],
    ),

    Food(
      name: 'Red Velvet Cake',
      price: 190,
      description: 'Soft red velvet cake with cream cheese frosting.',
      imagePath: 'lib/images/desserts/6.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Extra Cream Cheese Frosting", price: 35),
        Addon(name: "Chocolate Drizzle", price: 25),
        Addon(name: "Vanilla Ice Cream Scoop", price: 40),
        Addon(name: "Choco Chips", price: 20),
        Addon(name: "Whipped Cream", price: 20),
      ],
    ),

    Food(
      name: 'Butterscotch Pastry',
      price: 150,
      description: 'Crunchy butterscotch pastry with caramel.',
      imagePath: 'lib/images/desserts/7.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Extra Caramel Sauce", price: 25),
        Addon(name: "Butterscotch Nuts", price: 30),
        Addon(name: "Vanilla Ice Cream Scoop", price: 40),
        Addon(name: "Whipped Cream", price: 20),
        Addon(name: "Choco Chips", price: 20),
      ],
    ),

    Food(
      name: 'Chocolate Muffin',
      price: 110,
      description: 'Soft chocolate muffin with choco chips.',
      imagePath: 'lib/images/desserts/8.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Extra Choco Chips", price: 20),
        Addon(name: "Chocolate Syrup", price: 25),
        Addon(name: "Whipped Cream", price: 20),
        Addon(name: "Vanilla Ice Cream Scoop", price: 40),
        Addon(name: "Nut Topping", price: 30),
      ],
    ),

    Food(
      name: 'Fruit Custard',
      price: 120,
      description: 'Fresh fruits mixed with creamy custard.',
      imagePath: 'lib/images/desserts/9.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Extra Fruits", price: 30),
        Addon(name: "Dry Fruits Mix", price: 35),
        Addon(name: "Honey Drizzle", price: 20),
        Addon(name: "Vanilla Ice Cream Scoop", price: 40),
        Addon(name: "Whipped Cream", price: 20),
      ],
    ),

    Food(
      name: 'Chocolate Ice Cream',
      price: 100,
      description: 'Rich and creamy chocolate ice cream.',
      imagePath: 'lib/images/desserts/10.png',
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Choco Syrup", price: 20),
        Addon(name: "Extra Scoop", price: 40),
        Addon(name: "Brownie Bits", price: 30),
        Addon(name: "Choco Chips", price: 20),
        Addon(name: "Whipped Cream", price: 20),
      ],
    ),

    // 🥤 Drinks
    Food(
      name: 'Cold Coffee',
      price: 120,
      description: 'Chilled coffee with milk.',
      imagePath: 'lib/images/drinks/1.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Extra Shot", price: 30),
        Addon(name: "Whipped Cream", price: 25),
        Addon(name: "Chocolate Syrup", price: 20),
        Addon(name: "Caramel Syrup", price: 20),
        Addon(name: "Ice Cream Scoop", price: 40),
      ],
    ),
    Food(
      name: 'Chocolate Shake',
      price: 150,
      description: 'Rich chocolate milkshake.',
      imagePath: 'lib/images/drinks/2.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 25),
        Addon(name: "Extra Chocolate", price: 30),
        Addon(name: "Choco Chips", price: 20),
        Addon(name: "Ice Cream Scoop", price: 40),
        Addon(name: "Caramel Drizzle", price: 20),
      ],
    ),
    Food(
      name: 'Strawberry Shake',
      price: 150,
      description: 'Fresh strawberry milkshake.',
      imagePath: 'lib/images/drinks/3.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Extra Cream", price: 25),
        Addon(name: "Strawberry Syrup", price: 20),
        Addon(name: "Ice Cream Scoop", price: 40),
        Addon(name: "Choco Chips", price: 20),
        Addon(name: "Dry Fruits", price: 30),
      ],
    ),
    Food(
      name: 'Lemon Iced Tea',
      price: 110,
      description: 'Refreshing lemon iced tea.',
      imagePath: 'lib/images/drinks/4.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Mint", price: 15),
        Addon(name: "Extra Lemon", price: 15),
        Addon(name: "Honey", price: 20),
        Addon(name: "Ice Cubes", price: 10),
        Addon(name: "Ginger Zest", price: 15),
      ],
    ),
    Food(
      name: 'Cappuccino',
      price: 140,
      description: 'Hot frothy cappuccino.',
      imagePath: 'lib/images/drinks/5.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Extra Foam", price: 20),
        Addon(name: "Extra Shot", price: 30),
        Addon(name: "Chocolate Powder", price: 15),
        Addon(name: "Caramel Syrup", price: 20),
        Addon(name: "Soy Milk", price: 25),
      ],
    ),
    Food(
      name: 'Mocha Coffee',
      price: 160,
      description: 'Coffee blended with chocolate flavor.',
      imagePath: 'lib/images/drinks/6.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Extra Chocolate", price: 30),
        Addon(name: "Whipped Cream", price: 25),
        Addon(name: "Extra Shot", price: 30),
        Addon(name: "Choco Chips", price: 20),
        Addon(name: "Caramel Syrup", price: 20),
      ],
    ),
    Food(
      name: 'Mint Mojito',
      price: 130,
      description: 'Refreshing mint and lime drink.',
      imagePath: 'lib/images/drinks/7.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Extra Mint", price: 15),
        Addon(name: "Extra Lemon", price: 15),
        Addon(name: "Soda Splash", price: 20),
        Addon(name: "Ice Cubes", price: 10),
        Addon(name: "Sugar Syrup", price: 15),
      ],
    ),
    Food(
      name: 'Oreo Milkshake',
      price: 170,
      description: 'Creamy milkshake blended with Oreo cookies.',
      imagePath: 'lib/images/drinks/8.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Extra Oreo", price: 30),
        Addon(name: "Whipped Cream", price: 25),
        Addon(name: "Chocolate Syrup", price: 20),
        Addon(name: "Ice Cream Scoop", price: 40),
        Addon(name: "Choco Chips", price: 20),
      ],
    ),
    Food(
      name: 'Classic Hot Chocolate',
      price: 150,
      description: 'Warm chocolate drink topped with foam.',
      imagePath: 'lib/images/drinks/9.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Marshmallows", price: 25),
        Addon(name: "Whipped Cream", price: 25),
        Addon(name: "Extra Chocolate", price: 30),
        Addon(name: "Cinnamon Powder", price: 15),
        Addon(name: "Choco Chips", price: 20),
      ],
    ),
    Food(
      name: 'Fresh Orange Juice',
      price: 120,
      description: 'Freshly squeezed orange juice.',
      imagePath: 'lib/images/drinks/10.png',
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "Ice Cubes", price: 10),
        Addon(name: "Mint Leaves", price: 15),
        Addon(name: "Honey", price: 20),
        Addon(name: "Extra Pulp", price: 25),
        Addon(name: "Ginger Shot", price: 20),
      ],
    ),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //user delivery address
  String _deliveryAddress = "Enter Your Address";

  /*  Getters  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*  Operations  */

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons){
    //see if there is a cart item already with same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item){
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the last of selected addons are same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if the item already exits
    if(cartItem != null){
      cartItem.quantity++;
    }else{
      //otherwise, add a new cart item to the cart
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      if(_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice(){
    double total = 0.0;

    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total number of items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*  Helpers  */

  //generate a receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formatedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formatedDate);
    receipt.writeln();
    receipt.writeln("---------------");

    for(final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if(cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("   Addons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("---------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price){
    return "Rs.${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons){
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }
}