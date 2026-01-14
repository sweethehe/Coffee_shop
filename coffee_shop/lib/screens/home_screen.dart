import 'package:coffee_shop/common/coffe_container.dart';
import 'package:coffee_shop/common/data_base.dart';
import 'package:coffee_shop/common/selection_coffee_container.dart';
import 'package:coffee_shop/screens/coffe_details_screen.dart';
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
    "Machiatto",
  ];
  TextEditingController searchController = TextEditingController();

  //* Functions

  List getSelectedCoffeeList() {
    if (selectedIndex == 0) {
      return allCoffee;
    }
    String categoryName = categories[selectedIndex];

    return allCoffee
        .where((coffee) => coffee['category'] == categoryName)
        .toList();
  }

  List getCoffeeSearchList(String searchItem) {
    return allCoffee
        .where(
          (coffee) =>
              coffee['name'].toLowerCase().contains(searchItem.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: textColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                    top: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(color: backgroundColor),
                      ),
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
                      //* Search Bar
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: searchController,
                                onChanged: (value) {
                                  setState(() {
                                    getCoffeeSearchList(value);
                                  });
                                },

                                style: const TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
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
              if (searchController.text.isEmpty)
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

              Builder(
                builder: (context) {
                  final isSearching = searchController.text.isNotEmpty;
                  final coffeeList = isSearching
                      ? getCoffeeSearchList(searchController.text)
                      : getSelectedCoffeeList();

                  if (coffeeList.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          "No Coffee Found",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    );
                  }

                  return GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: coffeeList.length,
                    itemBuilder: (context, index) {
                      final selectedCoffee = coffeeList[index];
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
