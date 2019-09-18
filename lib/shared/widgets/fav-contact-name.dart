import 'package:flutter/material.dart';
import 'package:flutter_contacts/home/utilities/utilities.dart';

class FavContactName extends StatelessWidget {
  ///Shows the Favourite Contact's Initials

  const FavContactName({
    Key key,
    @required this.name,
  }) : super(key: key);

  ///Name to show
  final String name;

  @override
  Widget build(BuildContext context) {
    //
    final _initials = contactHelpers.fetchInitials(name);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.6),
        ),
        child: Text(
          '$_initials',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
