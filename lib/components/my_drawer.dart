import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';
import 'package:food_delivery_app/pages/settings_page.dart';
import 'package:food_delivery_app/services/auth/auth_gate.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
import 'package:food_delivery_app/web/web_layout.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  //logout user
  void logout() {
    final authService = AuthService();
    authService.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header
              DrawerHeader(
                child: Icon(Icons.fastfood_outlined, size: 40,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              const SizedBox(
                height: 25,
              ),

              //home tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              //Your Order tile
              // Padding(
              //   padding: const EdgeInsets.only(left: 25.0),
              //   child: ListTile(
              //     leading: Icon(Icons.shopping_bag_rounded,
              //         color: Theme.of(context).colorScheme.inversePrimary),
              //     title: Text("My Order"),
              //     onTap: () {
              //       Navigator.pop(context);
              //       Navigator.push(context, MaterialPageRoute(builder: (context) => WebLayout(child: DeliveryProgressPage())));
              //     },
              //   ),
              // ),

              //settings tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.settings,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WebLayout(child: SettingsPage())));
                  },
                ),
              ),

              //user tile
              // Padding(
              //   padding: const EdgeInsets.only(left: 25.0),
              //   child: ListTile(
              //     leading: Icon(Icons.group,
              //         color: Theme.of(context).colorScheme.inversePrimary),
              //     title: Text("U S E R S"),
              //     onTap: () {
              //       Navigator.pop(context);
              //       Navigator.pushNamed(context, '/users_page');
              //     },
              //   ),
              // ),
            ],
          ),

          //logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.inversePrimary),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                logout();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebLayout(child: AuthGate())));
              },
            ),
          ),
        ],
      ),
    );
  }
}
