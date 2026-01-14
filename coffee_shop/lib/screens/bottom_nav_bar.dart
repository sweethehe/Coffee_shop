import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:coffee_shop/screens/favorite_screen.dart';
import 'package:coffee_shop/screens/home_screen.dart';
import 'package:coffee_shop/ui/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;
  List screens = [HomeScreen(), FavoriteScreen(), CartScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Icon(Icons.home_rounded),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Icon(Icons.favorite_border_rounded),
                ),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
                label: "Cart",
              ),
            ],
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
          ),
        ),
      ),
    );
  }
}
