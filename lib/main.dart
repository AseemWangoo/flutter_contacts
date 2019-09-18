import 'package:flutter/material.dart';
import 'package:flutter_contacts/app-level/routes/routes.dart';
import 'package:flutter_contacts/app-level/theme/theme.dart';
import 'package:flutter_contacts/app-level/utilities/constants.dart';
import 'package:flutter_contacts/home/screens/home.dart';
import 'package:logger/logger.dart';

void main() {
  Logger.level = Level.verbose;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    //

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: kHomeRoute,
      home: Body(),
      onGenerateRoute: Router.generateRoute,
      theme: appThemeData(),
    );
  }
}
