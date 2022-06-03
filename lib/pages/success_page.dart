// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

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
              Image(
                image: AssetImage("img/Success.png"),
              ),
              Text(
                'تم إضافة البلاغ بنجاح',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Container(
                width: 400,
                child: Text(
                  'سنقوم باعلامك فور توفر أي معلومات جديدة، نرجوا أن يلتأم الشمل في أقرب ما يمكن.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 217,
                child: FlatButton(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'العودة إلى الرئيسية',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.home,
                        size: 36.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color.fromARGB(55, 30, 136, 229),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  highlightColor: Colors.blue,
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
