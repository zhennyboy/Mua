import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotifierPage extends StatefulWidget {
  const NotifierPage({super.key});

  @override
  State<NotifierPage> createState() => _NotifierPageState();
}

class _NotifierPageState extends State<NotifierPage> {
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
              "对方提醒",
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
