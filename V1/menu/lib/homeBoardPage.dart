import 'package:flutter/material.dart';
import 'home.dart';

class HomeBoardPage extends StatefulWidget {
  const HomeBoardPage({super.key});

  @override
  State<HomeBoardPage> createState() => _HomeBoardPageState();
}

class _HomeBoardPageState extends State<HomeBoardPage> {
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
          builder: (context) => const HomePage(),
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
              "assets/logo/main-pink-logo.png",
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
