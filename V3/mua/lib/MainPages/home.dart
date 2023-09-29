import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showLoveContent = true;
  bool showStoryContent = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Love and Story Header
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showLoveContent = true;
                      showStoryContent = false;
                    });
                  },
                  child: Text(
                    "Love",
                    style: (textTheme.titleLarge ?? const TextStyle()).copyWith(
                      color: showLoveContent
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).shadowColor,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showLoveContent = false;
                      showStoryContent = true;
                    });
                  },
                  child: Text(
                    "Story",
                    style: (textTheme.titleLarge ?? const TextStyle()).copyWith(
                      color: showStoryContent
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).shadowColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            //Love and Story Under Line
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
            // Love and Story Condition
            if (showLoveContent) ...[
              GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
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
            ] else if (showStoryContent)
              ...[],
          ],
        ),
      ),
    );
  }
}
