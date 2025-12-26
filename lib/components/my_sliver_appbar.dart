import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/cart_page.dart';
import 'package:food_delivery_app/web/web_layout.dart';

class MySliverAppbar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppbar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart button
        IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => WebLayout(child: CartPage())));},
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Center(child: Text("Sunset Diner")),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
