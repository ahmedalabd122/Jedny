import 'dart:ui';
import 'request.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:jedny/pages/missedForm.dart';
import 'dart:io';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                //width: double.maxFinite,
                //height: double.maxFinite,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //   image: AssetImage("img/" + images[index]),
                // )),
                child: Column(
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
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Container(
                          width: 260,
                          child: Text(
                            details[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
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
                                color: Colors.blue),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontFamily: 'NotoKufiArabic',
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                              onPressed: () async {
                                await ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) {
                                  _xFile = value;
                                });
                                print(_xFile?.path);
                                if (_xFile != null) {
                                  setState(() {
                                    //_image = File(_xFile!.path);
                                    Navigator.pushNamed(
                                      context,
                                      '/missed_form',
                                      arguments: _xFile?.path,
                                    );
                                  });
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
                ),
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
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutQuint,
                  );
                },
                child: const Text('تخطي'),
              ),
            ),
            Row(
              children: List.generate(3, (index) {
                return Container();
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
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutQuint,
                  );
                },
                child: Row(
                  children: const [
                    Text('التالي'),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.blue,
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
