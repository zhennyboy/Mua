import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menu/MenuTab/cart.dart';
import 'package:menu/MenuTab/favouriteMenu.dart';
import 'package:menu/MenuTab/herMenu.dart';
import 'package:menu/MenuTab/hisMenu.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<String> _crusineOptions = [
    '川菜',
    '鲁菜',
    '粤菜',
    '淮扬菜',
    '徽菜',
    '闽菜',
    '湘菜',
    '浙菜',
    '京菜',
    '沪菜',
  ];
  final List<bool> _iscrusineSelected = List<bool>.filled(10, false);
  final List<String> _tasteOptions = [
    '麻辣',
    '咸鲜',
    '酸辣',
    '甜酸',
    '五香',
    '甜',
    '鲜咸',
    '香辣'
  ];
  final List<bool> _istasteSelected = List<bool>.filled(8, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFEBEBEB),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  SvgPicture.asset(
                    "assets/icons/search.svg",
                    color: const Color(0xFFFF9696),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '麻辣小龙虾，锅包肉等',
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        //TODO: Handle the change of the search text
                      },
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 2,
                    color: const Color(0xFFAEAEAE),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              '筛选',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "菜系",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    spacing: 10.0,
                                    runSpacing: 5.0,
                                    children: List<Widget>.generate(
                                        _crusineOptions.length, (int index) {
                                      return ChoiceChip(
                                        label: Text(
                                          _crusineOptions[index],
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        selected: _iscrusineSelected[index],
                                        onSelected: (bool selected) {
                                          setState(() {
                                            _iscrusineSelected[index] =
                                                selected;
                                          });
                                        },
                                      );
                                    }),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "口味",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Wrap(
                                    spacing: 10.0,
                                    runSpacing: 5.0,
                                    children: List<Widget>.generate(
                                        _tasteOptions.length, (int index) {
                                      return ChoiceChip(
                                        label: Text(
                                          _tasteOptions[index],
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        selected: _istasteSelected[index],
                                        onSelected: (bool selected) {
                                          setState(() {
                                            _istasteSelected[index] = selected;
                                          });
                                        },
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('确定'),
                                onPressed: () {
                                  //TODO: Handle when the user presses the apply button
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('取消'),
                                onPressed: () {
                                  //TODO: Handle when the user presses the cancel button
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/icons/setting.svg",
                      color: const Color(0xFFFF9696),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
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
                                builder: (context) => const HisMenu()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xFFD6305E),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/book1.svg",
                                width: 30,
                                height: 30,
                                color: const Color(0xFFFF9696),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "他的菜单",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF9696),
                                ),
                              ),
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
                                builder: (context) => const HerMenu()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xFFD6305E),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/book.svg",
                                width: 30,
                                height: 30,
                                color: const Color(0xFFFF9696),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "她的菜单",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF9696),
                                ),
                              ),
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
                                builder: (context) => const FavouriteMenu()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xFFD6305E),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/bookmark.svg",
                                width: 30,
                                height: 30,
                                color: const Color(0xFFFF9696),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "收藏菜谱",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF9696),
                                ),
                              ),
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
                                builder: (context) => const CartPage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xFFD6305E),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/cart.svg",
                                width: 30,
                                height: 30,
                                color: const Color(0xFFFF9696),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "购物车",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF9696),
                                ),
                              ),
                            ],
                          ),
                        ),
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
