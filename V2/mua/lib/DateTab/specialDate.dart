import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SpecialDate extends StatefulWidget {
  const SpecialDate({super.key});

  @override
  State<SpecialDate> createState() => _SpecialDateState();
}

class _SpecialDateState extends State<SpecialDate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                      "纪念日",
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/plus.svg",
                    height: 20,
                    width: 20,
                    color: const Color(0xFFFF9696),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: Column(
                              children: [Text("添加纪念日")],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9696),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFFD6305E),
                          child: CircleAvatar(
                            radius: 35,
                          ),
                        ),
                        const SizedBox(width: 20),
                        SvgPicture.asset(
                          "assets/icons/heart.svg",
                          height: 30,
                          width: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 20),
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFFD6305E),
                          child: CircleAvatar(
                            radius: 35,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "我们相恋100天了",
                      style: TextStyle(color: Color(0xFFD6305E), fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "起始日：30/04/2023",
                      style: TextStyle(color: Color(0xFFD6305E), fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
