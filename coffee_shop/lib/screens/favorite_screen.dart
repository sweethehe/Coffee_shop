import 'package:coffee_shop/common/coffe_container.dart';
import 'package:coffee_shop/common/data_base.dart';
import 'package:coffee_shop/screens/coffe_details_screen.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Coffees"), automaticallyImplyLeading: false,),
      body: favoriteCoffee.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No favorite coffee found"),
                  SizedBox(height: 10),
                  Text("(╥_╥)"),
                ],
              ),
            )
          : SingleChildScrollView(
            child: Column(
                children: [
                  GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: favoriteCoffee.length,
                    itemBuilder: (context, index) {
                      final selectedCoffee = favoriteCoffee[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CoffeDetailsScreen(coffee: selectedCoffee),
                            ),
                          );
                        },
                        child: coffeeContainer(
                          name: selectedCoffee["name"],
                          description: selectedCoffee["description"],
                          price: (selectedCoffee["price"] as num).toDouble(),
                          rating: (selectedCoffee["rating"] as num).toDouble(),
                          image: selectedCoffee["image"],
                        ),
                      );
                    },
                  ),
                ],
              ),
          ),
    );
  }
}
