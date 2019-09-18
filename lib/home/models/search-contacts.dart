import 'package:flutter/foundation.dart';

class SearchedContacts with ChangeNotifier {
  ///Mention the search key...
  String searchKey = '';

  bool isSearchActive = false;

  ///Add to Favourites.....
  void searchedContacts(String _name) {
    searchKey = _name;
    notifyListeners();
  }

  ///If the search is active....
  void setSearchStatus(bool status) {
    isSearchActive = status;
    notifyListeners();
  }
}
