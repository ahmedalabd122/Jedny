import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jedny/models/matchedModel.dart';
import 'package:jedny/pages/foundForm.dart';
import 'package:jedny/pages/found_contacts.dart';
import 'package:jedny/pages/missedForm.dart';
import 'package:jedny/pages/missed_contacts.dart';
import 'package:jedny/pages/splash.dart';
import 'package:jedny/route_generator.dart';
import 'package:jedny/services/dynamicLinkService.dart';
import 'pages/missedForm.dart';
import 'pages/img_picker.dart';
import 'pages/missed_contacts.dart';
import 'pages/home_page.dart';
import 'pages/success_page.dart';
import 'route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jedny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoKufiArabic',
      ),
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
