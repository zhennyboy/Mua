import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mua/Theme/themeManager.dart';
import 'package:provider/provider.dart';

import 'Utils/imageNotifier.dart';
import 'Pages/calendarPage.dart';
import 'Pages/home.dart';
import 'Pages/menu.dart';
import 'Pages/moneyPage.dart';

import 'package:mua/Utils/onBoardPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImageNotifier()),
        ChangeNotifierProvider(create: (context) => ThemeManager()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      title: 'Mua',
      debugShowCheckedModeBanner: false,
      theme: themeManager.currentTheme,
      home: const OnBoardPage(),
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
        extendBody: _currentIndex == 0,
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
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    width: 24,
                    height: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/calendar-edit.svg',
                    width: 24,
                    height: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/money.svg',
                    width: 24,
                    height: 24,
                    color: Theme.of(context).primaryColor,
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
