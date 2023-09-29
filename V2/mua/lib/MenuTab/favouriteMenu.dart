import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteMenu extends StatefulWidget {
  const FavouriteMenu({super.key});

  @override
  State<FavouriteMenu> createState() => _FavouriteMenuState();
}

class _FavouriteMenuState extends State<FavouriteMenu> {
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
                  "收藏菜谱",
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
