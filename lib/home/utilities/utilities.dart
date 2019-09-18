import 'dart:collection';

import 'package:flutter_contacts/home/utilities/data.dart';
import 'package:flutter_contacts/home/utilities/todo.dart';

///Instance of Contact Helpers....
ContactHelpers contactHelpers = ContactHelpers();

class ContactHelpers {
  static final ContactHelpers _singleton = ContactHelpers._internal();

  factory ContactHelpers() {
    return _singleton;
  }

  ContactHelpers._internal();

  ///Fetches the contacts....
  Map<String, List<String>> get fetchContacts =>
      _ContactHelpers()._fetchContacts();

  ///Fetches the contacts as Map....
  Map<int, Map<String, Object>> get fetchContactsAsMap =>
      _ContactHelpers()._convertToMap();

  ///Checks whether the contact is favourite or not....
  bool isFavouriteContact(List<String> favList, String contactToCheck) =>
      _ContactHelpers()._checkForFavContact(favList, contactToCheck);

  ///Fetches the initials from a name....
  String fetchInitials(String name) => _ContactHelpers()._fetchInitials(name);

  ///Fetches the todo list....
  Map<int, Map<String, Object>> get fetchToDoList =>
      _ContactHelpers()._fetchTodoList();

  ///Searches by `searchTerm` from the contacts list....
  Map<int, Map<String, Object>> searchByName(String searchTerm) =>
      _ContactHelpers()._searchByName(searchTerm);
}

class _ContactHelpers {
  //Fetches the  Splay Tree contacts....
  SplayTreeMap<String, Set<String>> _fetchSplayTreeContacts(
      List<String> contacts) {
    //Groups the contacts on the basis of `First Letter` and `Names`
    SplayTreeMap<String, Set<String>> _groupOfContacts = SplayTreeMap();

    for (String name in contacts) {
      if (!_groupOfContacts.containsKey(name[0])) {
        /// If a key is missing, add it
        _groupOfContacts[name[0]] = Set<String>();
      }

      /// Then add a name as well
      _groupOfContacts[name[0]].add(name);
    }

    return _groupOfContacts;
  }

  //Fetches the  contacts....
  Map<String, List<String>> _fetchContacts() {
    //Contacts Map.....
    final _contacts = <String, List<String>>{};

    final _groupOfContacts = _fetchSplayTreeContacts(contacts);

    //Loop through the group of contacts...
    _groupOfContacts.forEach(
      (key, value) => _contacts.putIfAbsent(
        key,
        () => value.toList(growable: false),
      ),
    );

    return _contacts;
  }

  //Converts the splay tree into map....
  Map<int, Map<String, Object>> _convertToMap() {
    //Contacts Map.....
    final _contacts = <int, Map<String, Object>>{};

    final _groupOfContacts = _fetchSplayTreeContacts(contacts);

    int _indexKey = 0;

    //Loop through the group of contacts...
    _groupOfContacts.forEach(
      (key, value) {
        final _internalMap = <String, Object>{
          'key': key,
          'contacts': value.toList(growable: false),
        };

        _contacts[_indexKey] = _internalMap;

        _indexKey++;
      },
    );

    return _contacts;
  }

  //Converts a given list to map...
  Map<int, Map<String, Object>> _convertListToMap(
      SplayTreeMap<String, Set<String>> _groupOfContacts) {
    //Contacts Map.....
    final _contacts = <int, Map<String, Object>>{};

    int _indexKey = 0;

    //Loop through the group of contacts...
    _groupOfContacts.forEach(
      (key, value) {
        final _internalMap = <String, Object>{
          'key': key,
          'contacts': value.toList(growable: false),
        };

        _contacts[_indexKey] = _internalMap;

        _indexKey++;
      },
    );
    return _contacts;
  }

  //Check for the fav contacts...
  bool _checkForFavContact(List<String> favList, String contactToCheck) {
    bool status = false;

    favList.forEach((fav) {
      if (fav == contactToCheck) status = true;
    });

    return status;
  }

  //Fetches the initials of a name...
  String _fetchInitials(String name) {
    String initials = '';

    final _list = name.split(' ');

    _list.forEach((name) => initials += name[0]);

    return initials;
  }

  //Fetches the todo list....
  Map<int, Map<String, Object>> _fetchTodoList() {
    final _map = todoList;

    return _map;
  }

  //Searches the name by search Key...
  Map<int, Map<String, Object>> _searchByName(String searchKey) {
    //
    //Contacts Map.....
    final _contacts = <String>[];

    for (String name in contacts) {
      if (name.toLowerCase().contains(searchKey.toLowerCase())) {
        _contacts.add(name);
      }
    }

    final _groupOfContacts = _fetchSplayTreeContacts(_contacts);

    final _searchedMap = _convertListToMap(_groupOfContacts);

    return _searchedMap;
  }
}
