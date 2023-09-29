import 'package:flutter/material.dart';
import 'dart:async';

import 'package:menu/menu.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key); // Fix the super.key syntax

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  void initState() {
    super.initState();
    navigateToNextPage();
  }

  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MenuPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Image.asset(
              "assets/logo/menu-pink-logo.png",
              width: 200,
              height: 200,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 50),
          //TODO
        )
      ],
    ));
  }
}
