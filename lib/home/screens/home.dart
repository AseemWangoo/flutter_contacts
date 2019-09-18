import 'package:flutter/material.dart';
import 'package:flutter_contacts/home/models/fav-contacts.dart';
import 'package:flutter_contacts/home/models/search-contacts.dart';
import 'package:flutter_contacts/home/utilities/constants.dart';
import 'package:flutter_contacts/home/utilities/utilities.dart';
import 'package:flutter_contacts/home/widgets/contact-list.dart';
import 'package:flutter_contacts/home/widgets/favourties.dart';
import 'package:flutter_contacts/home/widgets/search.dart';
import 'package:flutter_contacts/home/widgets/todo-list.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  /// ----------------------------------------------------------
  /// Home Screen for the app.....
  /// ----------------------------------------------------------

  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //

  @override
  Widget build(BuildContext context) {
    //

    final _todoList = contactHelpers.fetchToDoList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(kMainScreenTitle),
      ),
      body: SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<FavContacts>(
              builder: (context) => FavContacts(),
            ),
            ChangeNotifierProvider<SearchedContacts>(
              builder: (context) => SearchedContacts(),
            ),
          ],
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchWidget(),
                Favourites(),
                ContactList(),
                Provider<Map<int, Map<String, Object>>>.value(
                  child: ToDoList(),
                  value: _todoList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
