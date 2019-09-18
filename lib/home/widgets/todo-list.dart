import 'package:flutter/material.dart';
import 'package:flutter_contacts/home/models/search-contacts.dart';
import 'package:flutter_contacts/home/models/todo-model.dart';
import 'package:flutter_contacts/home/utilities/constants.dart';
import 'package:flutter_contacts/shared/widgets/todo-card.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatelessWidget {
  ///Displays the Todo list...
  const ToDoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _todoMap = Provider.of<Map<int, Map<String, Object>>>(context);

    final _searchActive = Provider.of<SearchedContacts>(context).isSearchActive;

    return _showToDo(_searchActive, _todoMap);
  }

  //To show the To-Do list.....
  Widget _showToDo(bool status, Map<int, Map<String, Object>> _todoMap) {
    Widget _widget;

    if (status) {
      _widget = const SizedBox();
    } else {
      //

      _widget = Container(
        child: Column(
          children: List.generate(
            _todoMap.length,
            (index) {
              final _todoModel = TodoModel.fromMap(_todoMap[index]);

              return ToDoCard(
                name: _todoModel.taskName,
              );
            },
          )..insert(0, const Text(kTODOListTitle)),
        ),
      );
    }

    return _widget;
  }
}
