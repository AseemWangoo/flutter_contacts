import 'package:flutter/foundation.dart';

class FavContacts with ChangeNotifier {
  ///Fetch the favourites contacts....
  List<String> contactName = [];

  ///Add to Favourites.....
  void addToFavourites(List<String> _name) {
    contactName.addAll(_name);
    notifyListeners();
  }

  ///Remove from Favourites.....
  void removeFromFavourites(List<String> _name) {
    contactName.remove(_name.first);
    notifyListeners();
  }
}
