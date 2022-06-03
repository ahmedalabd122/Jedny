import 'package:flutter/material.dart';
import 'package:jedny/pages/foundForm.dart';
import 'package:jedny/pages/found_contacts.dart';
import 'package:jedny/pages/missedForm.dart';
import 'package:jedny/pages/missed_contacts.dart';
import 'package:jedny/pages/splash.dart';
import 'package:jedny/route_generator.dart';
import 'pages/missedForm.dart';
import 'pages/img_picker.dart';
import 'pages/missed_contacts.dart';
import 'pages/home_page.dart';
import 'pages/success_page.dart';
import 'route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      /* initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/splash': (context) => Splash(),
        '/missed_form': (context) => MissedForm(
              missed_image: Image.asset(
                "img/Layer-1.png",
                height: 200,
              ),
            ),
        '/missed_contact': (context) => MissedContact(),
        '/success': (context) => SuccessPage(),
        '/img_picker': (context) => ImagePickerScreen(),
        '/found_form': (context) => FoundForm(),
        '/found_contcat': (context) => FoundContact(),
      }, */
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Splash(),
    );
  }
}
