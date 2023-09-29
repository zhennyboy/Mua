import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainShopPage extends StatefulWidget {
  const MainShopPage({super.key});

  @override
  State<MainShopPage> createState() => _MainShopPageState();
}

class _MainShopPageState extends State<MainShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
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
                  "商城",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
