import 'package:flutter/material.dart';
import 'package:flutter_contacts/home/models/fav-contacts.dart';
import 'package:flutter_contacts/shared/widgets/fav-contact-name.dart';
import 'package:provider/provider.dart';

class Favourites extends StatelessWidget {
  ///Shows the favourite contacts...

  const Favourites({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _contactToShow = Provider.of<FavContacts>(context);

    return Container(
      child: Wrap(
        children: List.generate(
          _contactToShow.contactName.length,
          (index) {
            return FavContactName(
              name: _contactToShow.contactName[index],
            );
          },
        ),
      ),
    );
  }
}
