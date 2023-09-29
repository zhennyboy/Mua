import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HerMenu extends StatefulWidget {
  const HerMenu({super.key});

  @override
  State<HerMenu> createState() => _HerMenuState();
}

class _HerMenuState extends State<HerMenu> {
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
                  "她的菜谱",
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
