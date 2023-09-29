import 'package:custom_navigation_bar/custom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:menu/calendarPage.dart';
import 'package:menu/home.dart';
import 'package:menu/menu.dart';
import 'package:menu/moneyPage.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'external/imageNotifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ImageNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Font',
      ),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const MenuPage(),
    const CalendarPage(),
    const MoneyPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageNotifier>(builder: (context, imageNotifier, child) {
      return Scaffold(
        extendBody: false,
        body: Container(
          decoration: BoxDecoration(
            image: imageNotifier.image != null
                ? DecorationImage(
                    image: FileImage(imageNotifier.image!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: _children[_currentIndex],
        ),
        bottomNavigationBar: Transform.translate(
          offset: const Offset(0, -20),
          child: CustomNavigationBar(
            scaleFactor: 0.2,
            iconSize: 30.0,
            elevation: 2,
            isFloating: true,
            scaleCurve: Curves.bounceIn,
            borderRadius: const Radius.circular(20),
            selectedColor: const Color(0xff040307),
            strokeColor: const Color(0x30040307),
            unSelectedColor: const Color(0xffacacac),
            backgroundColor: Colors.white,
            items: [
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xFFFF9696),
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xFFFF9696),
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xFFFF9696),
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/money.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xFFFF9696),
                  ),
                ),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: onTabTapped,
          ),
        ),
      );
    });
  }
}
