import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  ///Creates the ToDo - Card...

  const ToDoCard({
    Key key,
    @required String name,
  })  : _name = name,
        super(key: key);

  ///Pass the name to be shown...
  final String _name;

  @override
  Widget build(BuildContext context) {
    //

    return Card(
      child: ListTile(
        trailing: const Icon(Icons.today),
        title: Text('$_name'),
      ),
    );
  }
}
