import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jedny/models/matchedModel.dart';
import 'package:jedny/pages/foundPages/found_contacts.dart';
import 'package:jedny/route_generator.dart';
import 'package:jedny/services/dynamicLinkService.dart';
import 'package:jedny/theme.dart';
import 'pages/img_picker.dart';
import 'pages/home_page.dart';
import 'pages/success_page.dart';
import 'route_generator.dart';

bool foundSplashed = false;
bool missedSplashed = false;
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jedny',
      theme: mainTheme,
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
