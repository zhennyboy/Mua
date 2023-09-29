import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mua/DateTab/notebook.dart';
import 'package:mua/DateTab/notifier.dart';
import 'package:mua/DateTab/specialDate.dart';
import 'package:mua/DateTab/wishList.dart';
import 'package:mua/Utils/imageNotifier.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Future pickImage(ImageSource source) async {
    var imageNotifier = Provider.of<ImageNotifier>(context, listen: false);

    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return;

      final image = File(pickedFile.path);

      // Use the provider to set the image.
      imageNotifier.setDateImage(image);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<ImageNotifier>(context).dateImg;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "记录",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
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
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF9696),
                      image: image != null
                          ? DecorationImage(
                              image: FileImage(image),
                              fit: BoxFit.cover,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color:
                                  const Color(0xFFFF9696), // Set the color here
                              child: Wrap(
                                children: <Widget>[
                                  ListTile(
                                    leading: SvgPicture.asset(
                                      "assets/icons/picture.svg",
                                      color: Colors.white,
                                    ),
                                    title: const Text(
                                      '选择照片',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      await pickImage(ImageSource.gallery);
                                    },
                                  ),
                                  ListTile(
                                    leading: SvgPicture.asset(
                                      "assets/icons/camera.svg",
                                      color: Colors.white,
                                    ),
                                    title: const Text(
                                      '拍摄照片',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      await pickImage(ImageSource.camera);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/picture.svg",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SpecialDate()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBEBEB),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(
                                  0xFFD6305E), // Set the border color
                              width: 2, // Set the border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/star.svg",
                                  height: 30,
                                  width: 30,
                                  color: const Color(0xFFFF9696),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "纪念日",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF9696),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WishListPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBEBEB),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(
                                  0xFFD6305E), // Set the border color
                              width: 2, // Set the border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/flag.svg",
                                  height: 30,
                                  width: 30,
                                  color: const Color(0xFFFF9696),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "恋爱清单",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF9696),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NotifierPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBEBEB),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(
                                  0xFFD6305E), // Set the border color
                              width: 2, // Set the border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/bell.svg",
                                  height: 30,
                                  width: 30,
                                  color: const Color(0xFFFF9696),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "对方提醒",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF9696),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NoteBookPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBEBEB),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(
                                  0xFFD6305E), // Set the border color
                              width: 2, // Set the border width
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/edit.svg",
                                  height: 30,
                                  width: 30,
                                  color: const Color(0xFFFF9696),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "记事本",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF9696),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
