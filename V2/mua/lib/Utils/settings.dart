import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mua/Utils/imageNotifier.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
    TextTheme textTheme = Theme.of(context).textTheme;
    final backgroundImage = Provider.of<ImageNotifier>(context).image;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
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
                const SizedBox(width: 20),
                Text(
                  "Settings",
                  style: textTheme.displayMedium,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: Column(
                              children: [],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Change Profile Detail",
                            style: textTheme.bodyMedium,
                          ),
                          SvgPicture.asset(
                            'assets/icons/user.svg',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  "更改背景",
                                  style: textTheme.displayMedium,
                                ),
                                const SizedBox(height: 20),
                                backgroundImage != null
                                    ? Image(
                                        image: FileImage(backgroundImage),
                                        height: 400,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Text(
                                            '照片显示错误',
                                            style: textTheme.displayMedium,
                                          );
                                        },
                                      )
                                    : Text('没有选择照片',
                                        style: textTheme.bodySmall),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 250,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
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
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              '选择照片',
                                              style: textTheme.bodyMedium,
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
                                          Theme.of(context).primaryColor,
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
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              '拍摄照片',
                                              style: textTheme.bodyMedium,
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
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Change Background Image",
                            style: textTheme.bodyMedium,
                          ),
                          SvgPicture.asset(
                            'assets/icons/picture.svg',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: Column(
                              children: [],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Change Theme",
                            style: textTheme.bodyMedium,
                          ),
                          SvgPicture.asset(
                            'assets/icons/background.svg',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
