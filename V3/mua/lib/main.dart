import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'MainPages/calendar.dart';
import 'MainPages/home.dart';
import 'MainPages/menu.dart';
import 'MainPages/money.dart';
import 'Theme/theme_manager.dart';
import 'Utils/image_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      title: 'Mua',
      debugShowCheckedModeBanner: false,
      home: const MainApp(),
      theme: themeManager.currentTheme,
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
            elevation: 0,
            isFloating: true,
            scaleCurve: Curves.bounceIn,
            borderRadius: const Radius.circular(30),
            strokeColor: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).highlightColor,
            items: [
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/calendar-edit.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: Center(
                  child: SvgPicture.asset(
                    'assets/icons/money.svg',
                    width: 24,
                    height: 24,
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
