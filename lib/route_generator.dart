import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jedny/pages/foundForm.dart';
import 'package:jedny/pages/found_contacts.dart';
import 'package:jedny/pages/home_page.dart';
import 'package:jedny/pages/img_picker.dart';
import 'package:jedny/pages/missedForm.dart';
import 'package:jedny/pages/missed_contacts.dart';
import 'package:jedny/pages/splash.dart';
import 'package:jedny/pages/success_page.dart';
import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/missed_contact':
        return MaterialPageRoute(builder: (_) => MissedContact());
      case '/success':
        return MaterialPageRoute(builder: (_) => SuccessPage());
      case '/img_picker':
        return MaterialPageRoute(builder: (_) => ImagePickerScreen());
      case '/found_form':
        return MaterialPageRoute(builder: (_) => FoundForm());
      case '/found_contact':
        return MaterialPageRoute(builder: (_) => FoundContact());
      case '/missed_form':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MissedForm(
              missed_image: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
