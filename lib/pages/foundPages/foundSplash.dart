import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:jedny/theme.dart';

class FoundSplash extends StatefulWidget {
  const FoundSplash({Key? key}) : super(key: key);

  @override
  State<FoundSplash> createState() => _FoundSplashState();
}

class _FoundSplashState extends State<FoundSplash> {
  File? _image;
  XFile? _xFile;
  final _picker = ImagePicker();
  PageController _controller = PageController();
  int _currentPage = 0;
  List images = ["tip_1.png", "tip_2.png", "tip_3.png"];
  List headLines = [
    'أضف بيانات الشخص المفقود',
    'أضف معلومات الاتصال الخاصة بك',
    'نرجو أن يلتأم الشمل قريبًا'
  ];
  List details = [
    'قم بإضافة صورة وبعض البيانات التي يمكن أن تساعدنا في التعرف على الشخص المفقود (الاسم، السن، صفات مميزة … إلخ)',
    'سنقوم باشعارك عبر التطبيق ورقم الهاتف الذي تضيفه فور توافر أي معلومات جديدة عن الشخص الذي تبحث عنه.',
    'نقوم بالبحث في قاعدة بيانات ضخمة من الأشخاص المفقودين كما نتلقى بلاغات من متطوعين بشكل مستمر حتى نساعد في عودة المفقودين إلى ذويهم'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: images.length,
            controller: _controller,
            onPageChanged: _onChanged,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              _currentPage = index;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage("img/" + images[index]),
                      ),
                      Text(
                        headLines[index],
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 260,
                        child: Text(
                          details[index],
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (index == 2)
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: secondaryColor),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              await ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) {
                                _xFile = value;
                              });
                              //print(_xFile?.path);
                              if (_xFile != null) {
                                setState(
                                  () {
                                    Navigator.popAndPushNamed(
                                        context, '/found_form',
                                        arguments: _xFile);
                                  },
                                );
                              }
                            },
                            child: const Text(
                              'ابدأ بإضافة صورة الشخص المفقود',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      else
                        Container()
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 20, fontFamily: 'NotoKufiArabic'),
                ),
                onPressed: () {
                  _controller.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutQuint,
                  );
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'NotoKufiArabic',
                      color: secondaryColor),
                ),
              ),
            ),
            Row(
              children: List.generate(3, (indexSlider) {
                return Container(
                    margin: const EdgeInsets.only(right: 1),
                    width: indexSlider == _currentPage ? 25 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: indexSlider == _currentPage
                          ? const Color(0xff1BD483)
                          : const Color(0xff1BD483).withOpacity(0.3),
                    ));
              }),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 00, 0),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutQuint,
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'التالي',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NotoKufiArabic',
                        color: primaryColor,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: secondaryColor,
                      size: 36.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }

  bool isLast() {
    return _currentPage == (images.length - 1);
  }

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}
