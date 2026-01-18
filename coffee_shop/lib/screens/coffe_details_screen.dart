import 'package:coffee_shop/common/custom_snack_bar.dart';
import 'package:coffee_shop/common/data_base.dart';
import 'package:coffee_shop/ui/colors.dart';
import 'package:flutter/material.dart';

class CoffeDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> coffee;
  const CoffeDetailsScreen({super.key, required this.coffee});

  @override
  State<CoffeDetailsScreen> createState() => _CoffeDetailsScreenState();
}

class _CoffeDetailsScreenState extends State<CoffeDetailsScreen> {
  //* Variables
  int selectedSize = 0;

  //* Functions
  void addToFavorite(final Map<String, dynamic> coffee) {
    setState(() {
      widget.coffee["isFavorite"] = !widget.coffee["isFavorite"];
    });
    if (widget.coffee["isFavorite"]) {
      favoriteCoffee.add(coffee);
    } else {
      favoriteCoffee.remove(coffee);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.coffee["name"],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              widget.coffee["isFavorite"]
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
            ),
            color: widget.coffee["isFavorite"] ? primaryColor : Colors.black,
            onPressed: () {
              addToFavorite(widget.coffee);
              widget.coffee["isFavorite"]
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(
                        message:
                            '${widget.coffee["name"]} added to favorites  ٩(ˊᗜˋ )و',
                        color: primaryColor,
                      ),
                    )
                  : ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(
                        message:
                            '${widget.coffee["name"]} removed from favorites  (◞ ‸ ◟ㆀ)',
                        color: promoColor,
                      ),
                    );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.coffee["image"]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  const SizedBox(height: 20),

                  //* COFFEE DETAILS
                  Text(
                    widget.coffee["name"],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Ice/Hot", style: TextStyle(color: Colors.grey)),
                      Spacer(),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: backgroundColor.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset("assets/icons/delivery_icon.png"),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: backgroundColor.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset("assets/icons/coffee_icon.png"),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: backgroundColor.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset("assets/icons/milk_icon.png"),
                      ),
                    ],
                  ),

                  //* Ratings
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star_rounded, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: widget.coffee["rating"].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " (240)",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),

                  //* DESCRIPTION
                  const SizedBox(height: 10),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.coffee["full_description"],
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),

                  //* SIZES
                  Text(
                    "Sizes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = 0;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: selectedSize == 0
                                ? primaryColor.withValues(alpha: 0.3)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selectedSize == 0
                                  ? primaryColor
                                  : backgroundColor,
                            ),
                          ),
                          child: Text("S"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = 1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: selectedSize == 1
                                ? primaryColor.withValues(alpha: 0.3)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selectedSize == 1
                                  ? primaryColor
                                  : backgroundColor,
                            ),
                          ),
                          child: Text("M"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = 2;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: selectedSize == 2
                                ? primaryColor.withValues(alpha: 0.3)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selectedSize == 2
                                  ? primaryColor
                                  : backgroundColor,
                            ),
                          ),
                          child: Text("L"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),

          //* ADD TO CART
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${(widget.coffee["price"] + (selectedSize == 0
                                ? 0
                                : selectedSize == 1
                                ? 1
                                : 2)).toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Map<String, dynamic> coffeeToAdd = Map.from(
                            widget.coffee,
                          );
                          coffeeToAdd['price'] =
                              widget.coffee["price"] +
                              (selectedSize == 0
                                  ? 0
                                  : selectedSize == 1
                                  ? 1
                                  : 2);
                          coffeeToAdd['size'] = selectedSize == 0
                              ? "S"
                              : selectedSize == 1
                              ? "M"
                              : "L";

                          cartCoffee.add(coffeeToAdd);
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(
                              message:
                                  '${widget.coffee["name"]} (${coffeeToAdd['size']}) added to cart (˶ˆᗜˆ˵)',
                              color: primaryColor,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Buy now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
