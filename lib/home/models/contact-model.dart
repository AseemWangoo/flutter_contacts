class ContactModel {
  ///Converts map to the respective items.

  ContactModel.fromMap(Map<String, dynamic> map)
      : contactGroupName = map['key'],
        contactNames = map['contacts'] as List<String>;

  ///Name of the Group....
  final String contactGroupName;

  ///Contacts inside the group....
  final List<String> contactNames;
}
