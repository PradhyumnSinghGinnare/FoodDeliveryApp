import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:food_delivery_app/web/web_layout.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      //cart
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear all cart items button
            IconButton(
              onPressed: (){
                showDialog(context: context, builder: (context) => userCart.isEmpty ? AlertDialog(
                  title: Text("Cart is already empty.."),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebLayout(child: HomePage())));
                        },
                      child: Text("Go to home")
                    ),
                  ],
                ) : AlertDialog(
                  title: Text("Are you sure you want to clear the cart?"),
                  actions: [
                    TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
                    TextButton(onPressed: (){Navigator.pop(context); restaurant.clearCart();}, child: Text("Yes")),
                  ],
                ));
              },
              icon: Icon(Icons.delete)
            )
          ],
        ),
        body: Column(
          children: [

            //list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty ? Expanded(child: Center(child: Text("Cart is empty.."))) : Expanded(
                    child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        //get individual cart item
                        final cartItem = userCart[index];

                        //return cart tile UI
                        return MyCartTile(cartItem: cartItem);
                      }
                    ),
                  ),
                ],
              ),
            ),

            //button to pay
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Go to checkout",
                onTap: (){
                  if(userCart.isEmpty){
                    showDialog(context: context, builder: (context) =>  AlertDialog(
                      title: Text("Add item in your cart.."),
                      actions: [
                        TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => WebLayout(child: HomePage())));
                            },
                            child: Text("Go to home")
                        ),
                      ],
                    ));
                  }else{
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WebLayout(child: PaymentPage())));
                  }
                }
              ),
            ),
          ],
        ),
      );
    });
  }
}
