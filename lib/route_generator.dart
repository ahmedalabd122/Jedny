import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jedny/models/matchedModel.dart';
import 'package:jedny/models/missedPersonModel.dart';
import 'package:jedny/pages/foundForm.dart';
import 'package:jedny/pages/found_contacts.dart';
import 'package:jedny/pages/home_page.dart';
import 'package:jedny/pages/img_picker.dart';
import 'package:jedny/pages/matched.dart';
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
        if (args is MissedPerson) {
          return MaterialPageRoute(
            builder: (_) => MissedContact(
              missedPerson: args,
            ),
          );
        } else {
          return _errorRoute();
        }
      case '/success':
        return MaterialPageRoute(builder: (_) => SuccessPage());
      case '/img_picker':
        return MaterialPageRoute(builder: (_) => ImagePickerScreen());
      case '/found_form':
        if (args is XFile) {
          return MaterialPageRoute(
            builder: (_) => FoundForm(
              found_image: args,
            ),
          );
        } else {
          return _errorRoute();
        }
      case '/found_contact':
        return MaterialPageRoute(builder: (_) => FoundContact());
      // case '/matched':
      //   if (args is MatchedModel) {
      //     return MaterialPageRoute(
      //       builder: (_) => MatchedData(
      //         matchedModel: args,
      //       ),
      //     );
      //   } else {
      //     return MaterialPageRoute(
      //         builder: (_) => MatchedData(
      //               matchedModel: MatchedModel(),
      //             ));
      //   }
      case '/missed_form':
        // Validation of correct data type
        if (args is XFile) {
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
    return MaterialPageRoute(builder: (_) => HomePage());
  }
}
