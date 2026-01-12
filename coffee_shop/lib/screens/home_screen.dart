import 'package:coffee_shop/common/coffe_container.dart';
import 'package:coffee_shop/common/data_base.dart';
import 'package:coffee_shop/common/selection_coffee_container.dart';
import 'package:coffee_shop/ui/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<String> categories = [
    "All coffee",
    "Latte",
    "Americano",
    "Machiato",
  ];

  List getSelectedCoffeeList() {
    switch (selectedIndex) {
      case 0:
        return allCoffee;
      case 1:
        return lattes;
      case 2:
        return americano;
      case 3:
        return machiatos;
      default:
        return allCoffee;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: textColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location", style: TextStyle(color: backgroundColor)),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        Text(
                          "France, Paris",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: textColor),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                hintText: "Search Coffee",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.menu_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //* PUB
            Stack(
              children: [
                Container(color: textColor, height: 110),
                Padding(
                  padding: const EdgeInsets.all(26),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/promo_banner.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: promoColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Promo",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          "Buy one, get one FREE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            backgroundColor: textColor,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //* Coffee list
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return SelectionCoffeeContainer(
                    title: categories[index],
                    isTapped: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),

            GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: getSelectedCoffeeList().length,
              itemBuilder: (context, index) {
                final selectedCoffee = getSelectedCoffeeList()[index];
                return coffeeContainer(
                  name: selectedCoffee["name"],
                  description: selectedCoffee["description"],
                  price: (selectedCoffee["price"] as num).toDouble(),
                  rating: (selectedCoffee["rating"] as num).toDouble(),
                  image: selectedCoffee["image"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
