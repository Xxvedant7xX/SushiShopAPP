import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove from cart
  void removeFromCart(Food food, BuildContext context){

    //get access to shop
    final shop = context.read<Shop>();
    
    //remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => 
      Scaffold(
      appBar: AppBar(
        title: Text('My Cart',
        style: TextStyle(),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          //customer cart
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                //get the food from cart
                final Food food = value.cart[index];
              
                //get food name
                final String foodName = food.name;
              
                //get food price
                final String foodPrice = food.price;
              
                //return list tile
                return Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.only(
                    left: 20, right: 20, top: 20,
                  ),
                  child: ListTile(
                    title: Text(
                      foodName,
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                    subtitle: Text(foodPrice,
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                    ),
                    trailing: IconButton(
                      onPressed: () => removeFromCart(food, context), 
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey[300],
                        ),
                      ),
                  ),
                );
              },
              ),
            ),
          ),
          //pay button
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: MyButton(
                text: "Pay Now", 
              onTap: (){}
              ),
            ),
          ),
        ],
      ),
    ),
      );
  }
}