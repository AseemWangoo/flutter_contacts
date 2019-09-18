import 'package:flutter/material.dart';
import 'package:flutter_contacts/home/utilities/constants.dart';

class ContactDetails extends StatelessWidget {
  /// Displays the information about the selected contact....

  const ContactDetails({
    Key key,
    @required this.name,
  }) : super(key: key);

  ///Name of the contact...
  final String name;

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        title: const Text(kDetailsScreenTitle),
      ),
      body: _IntenalWidget(name: name),
    );
  }
}

class _IntenalWidget extends StatelessWidget {
  //Internal Widget....

  const _IntenalWidget({
    Key key,
    @required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    //

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlutterLogo(
            style: FlutterLogoStyle.horizontal,
            size: 100.0,
          ),
          Text(
            'I am $name, a Flutter Enthusiast.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
