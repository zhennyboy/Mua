import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mua/Utils/settings.dart';
import 'package:provider/provider.dart';

import 'package:mua/Utils/imageNotifier.dart';
import 'package:mua/HomeTab/shop.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int date = 100;
  bool showSpaceContent = true;
  bool showStatusContent = false;
  int selectedCalendarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final backgroundImage = Provider.of<ImageNotifier>(context).image;
    final profileImage = Provider.of<ImageNotifier>(context).profileImg;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        image: backgroundImage != null
            ? DecorationImage(
                image: FileImage(backgroundImage),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showSpaceContent = true;
                          showStatusContent = false;
                        });
                      },
                      child: Text(
                        "Love",
                        style: (textTheme.displayMedium ?? const TextStyle())
                            .copyWith(
                          color: showSpaceContent
                              ? Theme.of(context).primaryColor
                              : const Color(0xFFD9D9D9),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showSpaceContent = false;
                          showStatusContent = true;
                        });
                      },
                      child: Text(
                        "Story",
                        style: (textTheme.displayMedium ?? const TextStyle())
                            .copyWith(
                          color: !showSpaceContent
                              ? Theme.of(context).primaryColor
                              : const Color(0xFFD9D9D9),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  color: const Color(0xFFD9D9D9),
                )
              ],
            ),
          ),
          if (showSpaceContent) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingPage()));
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/setting.svg',
                              width: 24,
                              height: 24,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainShopPage()));
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/shop.svg',
                              width: 24,
                              height: 24,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Thinking of You",
                                          style: textTheme.displayMedium,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 50),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: () => setState(
                                              () => selectedCalendarIndex = 0),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            child: Text('His',
                                                style: textTheme.bodyMedium),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => setState(
                                              () => selectedCalendarIndex = 1),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            child: Text('Her',
                                                style: textTheme.bodyMedium),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => setState(
                                              () => selectedCalendarIndex = 2),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            child: Text('Our',
                                                style: textTheme.bodyMedium),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    _buildCalendar(),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      'Close',
                                      style: textTheme.displaySmall,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/calendar-check.svg',
                              width: 24,
                              height: 24,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: const Color(0xFFD6305E),
                            child: CircleAvatar(
                                radius: 38,
                                backgroundImage: profileImage != null
                                    ? FileImage(profileImage)
                                        as ImageProvider<Object>
                                    : const AssetImage(
                                        "assets/test/1.png") //TODO,
                                ),
                          ),
                          const Positioned(
                            top: 70,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xFFD6305E),
                              child: CircleAvatar(
                                  radius: 38,
                                  backgroundImage:
                                      AssetImage("assets/test/2.png") //TODO,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 20),
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Color(0xFFD6305E),
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/heart.svg",
                                  color: Theme.of(context).primaryColor,
                                  width: 30,
                                  height: 30,
                                ),
                                Text(
                                  " $date ".split('').join('\n'),
                                  style: textTheme.displayMedium,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Days ".split('').join('\n'),
                                  style: textTheme.displayMedium,
                                  textAlign: TextAlign.center,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/heart.svg",
                                  color: Theme.of(context).primaryColor,
                                  width: 30,
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ] else if (showStatusContent)
            ...[],
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return SizedBox(
      height: 350,
      width: 300,
      child: TableCalendar(
        firstDay: DateTime.now().subtract(const Duration(days: 30)),
        lastDay: DateTime.now().add(const Duration(days: 30)),
        focusedDay: DateTime.now(),
        selectedDayPredicate: (day) => isSameDay(day, DateTime.now()),
        onPageChanged: (focusedDay) {},
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          leftChevronMargin: EdgeInsets.only(left: 16.0), // <-- Adjusted this
          leftChevronIcon: Padding(
            // <-- Added this padding
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(FontAwesomeIcons.chevronLeft, size: 15.0),
          ),
          rightChevronMargin: EdgeInsets.only(right: 16.0), // <-- Adjusted this
          rightChevronIcon: Padding(
            // <-- Added this padding
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(FontAwesomeIcons.chevronRight, size: 15.0),
          ),
        ),
        calendarStyle: const CalendarStyle(
          defaultTextStyle: TextStyle(color: Color(0xFFFF9696)),
          outsideTextStyle: TextStyle(color: Color(0xFFFF9696)),
          todayTextStyle: TextStyle(color: Colors.white),
          todayDecoration: BoxDecoration(
            color: Color(0xFFD6305E),
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(color: Colors.white),
          selectedDecoration: BoxDecoration(
            color: Color(0xFFD6305E),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
