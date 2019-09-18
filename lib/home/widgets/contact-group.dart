import 'package:flutter/material.dart';
import 'package:flutter_contacts/home/models/contact-model.dart';
import 'package:flutter_contacts/shared/widgets/contact-name.dart';
import 'package:provider/provider.dart';

class ContactGroups extends StatelessWidget {
  ///Shows the Contact Groups....

  const ContactGroups({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _contactModel = Provider.of<ContactModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GroupName(contactModel: _contactModel),
        ]
          ..addAll(
            _buildList(context, _contactModel.contactNames),
          )
          ..add(const Divider(color: Colors.black26)),
      ),
    );
  }

  //Converts to the list of contacts.
  List<Widget> _buildList(
    BuildContext context,
    List<String> data,
  ) {
    return data.map((content) => _buildContacts(context, content)).toList();
  }

  //Build the custom contact widget.
  Widget _buildContacts(BuildContext context, String data) =>
      ContactName(name: data);
}

class _GroupName extends StatelessWidget {
  //Internal Widget....

  const _GroupName({
    Key key,
    @required ContactModel contactModel,
  })  : _contactModel = contactModel,
        super(key: key);

  final ContactModel _contactModel;

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      color: Colors.grey[200],
      child: Row(
        children: [
          Text(
            _contactModel.contactGroupName,
            style: Theme.of(context).textTheme.body2,
          ),
        ],
      ),
    );
  }
}
