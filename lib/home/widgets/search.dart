import 'package:flutter/material.dart';
import 'package:flutter_contacts/home/models/search-contacts.dart';
import 'package:flutter_contacts/home/utilities/constants.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  ///Creates the Search Widget....

  const SearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _searchTerm = Provider.of<SearchedContacts>(context);

    return _InternalWidget(
      searchTerm: _searchTerm,
    );
  }
}

class _InternalWidget extends StatelessWidget {
  ///Internal Widget

  const _InternalWidget({
    Key key,
    @required SearchedContacts searchTerm,
  })  : _searchTerm = searchTerm,
        super(key: key);

  final SearchedContacts _searchTerm;

  @override
  Widget build(BuildContext context) {
    //

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: Material(
        color: Colors.grey.withOpacity(0.1),
        child: TextField(
          onChanged: (key) {
            _searchTerm.searchedContacts(key);

            if (key.length == 0)
              _searchTerm.setSearchStatus(false);
            else
              _searchTerm.setSearchStatus(true);
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: kSearchHint,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          textInputAction: TextInputAction.search,
        ),
      ),
    );
  }
}
