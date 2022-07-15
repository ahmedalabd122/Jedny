// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:jedny/theme.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Image(
                image: AssetImage("img/Success.png"),
              ),
              Text(
                'تم إضافة البلاغ بنجاح',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(
                width: 400,
                child: Text(
                  'سنقوم باعلامك فور توفر أي معلومات جديدة، نرجوا أن يلتأم الشمل في أقرب ما يمكن.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 217,
                child: FlatButton(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'العودة إلى الرئيسية',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.home,
                        size: 36.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: secondaryColor.withOpacity(0.8),
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                  highlightColor: secondaryColor,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (r) => false);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
