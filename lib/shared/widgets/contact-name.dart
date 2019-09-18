import 'package:flutter/material.dart';
import 'package:flutter_contacts/app-level/utilities/constants.dart';
import 'package:flutter_contacts/home/models/fav-contacts.dart';
import 'package:flutter_contacts/home/utilities/utilities.dart';
import 'package:provider/provider.dart';

class ContactName extends StatelessWidget {
  /// Show the contact as list...

  const ContactName({
    Key key,
    @required this.name,
  }) : super(key: key);

  ///Name of the contact...
  final String name;

  @override
  Widget build(BuildContext context) {
    //
    final _contactToAdd = Provider.of<FavContacts>(context);

    final _isFav = contactHelpers.isFavouriteContact(
      _contactToAdd.contactName,
      name,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Text(name),
          onTap: () => _actionOnContactClick(context),
        ),
        _showStarredIcon(_isFav, context),
      ],
    );
  }

  //What happens on contact click..
  void _actionOnContactClick(BuildContext context) async {
    //

    await Navigator.pushNamed(
      context,
      kDetailsRoute,
      arguments: '$name',
    );
  }

  //Show Starred Contact...
  Widget _showStarredIcon(bool status, BuildContext context) {
    Widget _widget;

    final _contactToAdd = Provider.of<FavContacts>(context);

    if (status) {
      _widget = GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.star,
            color: Colors.yellow[900],
          ),
        ),
        onTap: () => _contactToAdd.removeFromFavourites([name]),
      );
    } else {
      _widget = GestureDetector(
        child: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            Icons.star_border,
          ),
        ),
        onTap: () => _contactToAdd.addToFavourites([name]),
      );
    }

    return _widget;
  }
}
