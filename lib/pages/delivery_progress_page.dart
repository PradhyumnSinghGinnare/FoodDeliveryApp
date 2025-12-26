import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_receipt.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/services/database/firestore.dart';
import 'package:food_delivery_app/web/web_layout.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //get access to database
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();
    //if we get to this page, submit the order to database
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          //cart button
          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => WebLayout(child: HomePage())));},
          )
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt(),
          ],
        ),
      ),
    );
  }

  //Custom Bottom Nav Bar - Message / Call delivery driver
  Widget? _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.person)
            ),
          ),
          SizedBox(width: 10,),

          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ramesh Sahu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.inversePrimary),),
              Text("Driver", style: TextStyle(color: Theme.of(context).colorScheme.primary),)
            ],
          ),

          Spacer(),

          Row(
            children: [
              //message button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              SizedBox(width: 10,),

              //call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.call),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
