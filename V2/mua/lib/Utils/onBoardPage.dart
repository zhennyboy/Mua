import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mua/Pages/home.dart';
import 'package:mua/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final controller = PageController();
  bool isLastPage = false;
  bool isFirstPage = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<bool> _checkIfFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first_launch') ?? true;
  }

  Future<void> _setFirstLaunchFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_launch', false);
  }

  void _navigateToNextScreen(BuildContext context) {
    if (isLastPage) {
      _setFirstLaunchFlag();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MainApp(),
      ));
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    _checkIfFirstLaunch().then((isFirstLaunch) {
      if (!isFirstLaunch) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const MainApp(),
          ));
        });
      }
    });

    Timer(const Duration(seconds: 2), () {
      if (isFirstPage) {
        _navigateToNextScreen(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isFirstPage = index == 0;
              isLastPage = index == 3;
            });
          },
          children: [
            const Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image(
                    image: AssetImage("assets/logo/main-pink-logo.png"),
                    fit: BoxFit.contain),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/logo/menuLogo.png")),
                  Text("情侣菜单", style: textTheme.displayLarge)
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Image(
                      image: AssetImage("assets/logo/aniversaryLogo.png")),
                  Text("情侣小本", style: textTheme.displayLarge),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/logo/moneyLogo.png")),
                  Text("情侣账单", style: textTheme.displayLarge),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isFirstPage
          ? null
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text("Previous", style: textTheme.displaySmall),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 14,
                        dotColor: const Color(0xFFFF9696).withOpacity(0.5),
                        activeDotColor: const Color(0xFFD6305E),
                      ),
                      onDotClicked: (index) {
                        controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  ),
                  isLastPage
                      ? TextButton(
                          onPressed: () async {
                            _navigateToNextScreen(context);
                          },
                          child: Text("Start", style: textTheme.displaySmall),
                        )
                      : TextButton(
                          onPressed: () {
                            _navigateToNextScreen(context);
                          },
                          child: Text("Next", style: textTheme.displaySmall),
                        ),
                ],
              ),
            ),
    );
  }
}
