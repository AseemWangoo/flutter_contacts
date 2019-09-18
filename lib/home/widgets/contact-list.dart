import 'package:flutter/material.dart';
import 'package:flutter_contacts/home/models/contact-model.dart';
import 'package:flutter_contacts/home/models/search-contacts.dart';
import 'package:flutter_contacts/home/utilities/utilities.dart';
import 'package:flutter_contacts/home/widgets/contact-group.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  ///Shows the Contact Name....

  const ContactList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _searchedTerm = Provider.of<SearchedContacts>(context);

    final _contactMap = contactHelpers.searchByName(_searchedTerm.searchKey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        _contactMap.length,
        (index) {
          //
          final _contactModel = ContactModel.fromMap(_contactMap[index]);

          return Provider<ContactModel>.value(
            value: _contactModel,
            child: ContactGroups(),
          );
        },
      ),
    );
  }
}
