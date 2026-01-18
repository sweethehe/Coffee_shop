import 'package:coffee_shop/common/button.dart';
import 'package:coffee_shop/common/cart_coffe_container.dart';
import 'package:coffee_shop/common/data_base.dart';
import 'package:coffee_shop/screens/bottom_nav_bar.dart';
import 'package:coffee_shop/ui/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Votre panier"),
        automaticallyImplyLeading: false,
      ),
      body: cartCoffee.isEmpty
          ? Center(child: Text("Your cart is empty (◞ ‸ ◟ㆀ)"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartCoffee.length,
                    itemBuilder: (context, index) {
                      return cartCoffeeContainer(
                        cartCoffee[index],
                        () {
                          setState(() {
                            cartCoffee[index]['quantity']++;
                          });
                        },
                        () {
                          setState(() {
                            if (cartCoffee[index]['quantity'] > 1) {
                              cartCoffee[index]['quantity']--;
                            } else {
                              cartCoffee.removeAt(index);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                customButton(
                  context: context,
                  text: "Checkout",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: primaryColor,
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        content: Text(
                          'Your order has been placed (˶ˆᗜˆ˵) - See you soon!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    cartCoffee.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
