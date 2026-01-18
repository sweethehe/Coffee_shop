import 'package:coffee_shop/common/cart_coffe_container.dart';
import 'package:coffee_shop/common/data_base.dart';
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
          : ListView.builder(
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
    );
  }
}
