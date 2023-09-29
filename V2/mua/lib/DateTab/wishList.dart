import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
              "恋爱清单",
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
