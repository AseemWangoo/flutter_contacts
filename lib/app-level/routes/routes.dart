import 'package:flutter/material.dart';
import 'package:flutter_contacts/app-level/utilities/constants.dart';
import 'package:flutter_contacts/home/screens/details.dart';
import 'package:flutter_contacts/home/screens/home.dart';

class Router {
  /// ----------------------------------------------------------
  /// Creates the Routes Options for the app....
  /// ----------------------------------------------------------

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Begin...

    switch (settings.name) {
      //Begin...

      case kHomeRoute:
        return MaterialPageRoute(
          builder: (_) => Body(),
        );

      case kDetailsRoute:
        final _data = settings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => ContactDetails(
            name: _data,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
