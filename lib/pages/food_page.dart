import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key, required this.food}){
    //initialize selected addons to be false
    for(Addon addon in food.availableAddons){
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(Food food, Map<Addon, bool> selectedAddons){

    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    
    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(widget.food.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

                      //food price
                      Text("Rs. ${widget.food.price}", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),),
                      SizedBox(height: 10,),

                      //food description
                      Text(widget.food.description, style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary),),
                      SizedBox(height: 10,),

                      Divider(color: Theme.of(context).colorScheme.secondary,),
                      SizedBox(height: 10,),

                      //addons
                      Text("Add-ons", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).colorScheme.inversePrimary),),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.secondary,), borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.zero,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index){
                              //get individual addon
                              Addon addon = widget.food.availableAddons[index];

                              //return check box UI
                              return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Text("Rs. ${addon.price}", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                                  value: widget.selectedAddons[addon],
                                  onChanged: (bool? value){
                                    setState(() {
                                      widget.selectedAddons[addon] = value!;
                                    });
                                  }
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),

                //button -> add to cart
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: MyButton(text: "Add to cart", onTap: () => addToCart(widget.food, widget.selectedAddons)),
                ),

                SizedBox(height: 25,),
              ],
            ),
          ),
        ),

        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: EdgeInsets.only(left: 25, top: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ]
    );
  }
}
