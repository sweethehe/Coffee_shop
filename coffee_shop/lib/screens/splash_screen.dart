import 'package:coffee_shop/common/button.dart';
import 'package:coffee_shop/screens/bottom_nav_bar.dart';
import 'package:coffee_shop/ui/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(
            'assets/images/6.png',
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Text(
            'Fall in Love with Coffee in Blissful Delight!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
              style: TextStyle(color: backgroundColor, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          customButton(
            context: context,
            text: 'Get Started',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavBarScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
