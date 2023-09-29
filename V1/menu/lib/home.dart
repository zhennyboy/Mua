import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:menu/HomeTab/userPage.dart';
import 'external/imageNotifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int date = 100;

  Future pickImage(ImageSource source) async {
    var imageNotifier = Provider.of<ImageNotifier>(context, listen: false);

    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return;

      final image = File(pickedFile.path);

      // Use the provider to set the image.
      imageNotifier.setImage(image);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<ImageNotifier>(context).image;

    return Container(
      decoration: BoxDecoration(
        image: image != null
            ? DecorationImage(
                image: FileImage(image),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Column(
        children: [
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
                        //TODO
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
                            'assets/icons/side.svg',
                            width: 24,
                            height: 24,
                            color: const Color(0xFFFF9696),
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
                                builder: (context) => const UserPage()));
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
                            'assets/icons/user.svg',
                            width: 24,
                            height: 24,
                            color: const Color(0xFFFF9696),
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
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const Text(
                                      "更改背景",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    image != null
                                        ? Image(
                                            image: FileImage(image),
                                            height: 400,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return const Text('照片显示错误');
                                            },
                                          )
                                        : const Text('没有选择照片'),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 250,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              const Color(0xFFFF9696),
                                        ),
                                        onPressed: () async {
                                          await pickImage(ImageSource.gallery);
                                          if (mounted) {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/picture.svg",
                                              color: Colors.white,
                                            ),
                                            const Expanded(
                                              child: Center(
                                                child: Text(
                                                  '选择照片',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              const Color(0xFFFF9696),
                                        ),
                                        onPressed: () async {
                                          await pickImage(ImageSource.camera);
                                          if (mounted) {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/camera.svg",
                                              color: Colors.white,
                                            ),
                                            const Expanded(
                                              child: Center(
                                                child: Text(
                                                  '拍摄照片',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                            'assets/icons/picture.svg',
                            width: 24,
                            height: 24,
                            color: const Color(0xFFFF9696),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFFD6305E),
                          child: CircleAvatar(
                            radius: 38,
                            backgroundImage: AssetImage("assets/test/1.png"),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xFFD6305E),
                            child: CircleAvatar(
                              radius: 38,
                              backgroundImage: AssetImage("assets/test/2.png"),
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
                              Text(
                                "我们相恋".split('').join('\n'),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFFFF9696),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "$date".split('').join('\n'),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 24,
                                  color: Color(0xFFFF9696),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "天了".split('').join('\n'),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFFFF9696),
                                ),
                                textAlign: TextAlign.center,
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
        ],
      ),
    );
  }
}
