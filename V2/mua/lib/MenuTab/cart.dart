import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/back.svg",
                    height: 20,
                    width: 20,
                    color: const Color(0xFFFF9696),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Text(
                  "购物车",
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
