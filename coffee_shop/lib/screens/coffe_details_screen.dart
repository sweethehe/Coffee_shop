import 'package:coffee_shop/ui/colors.dart';
import 'package:flutter/material.dart';

class CoffeDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> coffee;
  const CoffeDetailsScreen({super.key, required this.coffee});

  @override
  State<CoffeDetailsScreen> createState() => _CoffeDetailsScreenState();
}

class _CoffeDetailsScreenState extends State<CoffeDetailsScreen> {
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
            icon: Icon(Icons.favorite_border_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: backgroundColor),
                    ),
                    child: Text("S"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: backgroundColor),
                    ),
                    child: Text("M"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: backgroundColor),
                    ),
                    child: Text("L"),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //* ADD TO CART
              Container(
                padding: const EdgeInsets.all(18),
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
                          "\$ ${widget.coffee["price"]}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        Container(
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
