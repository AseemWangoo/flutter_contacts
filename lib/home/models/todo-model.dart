class TodoModel {
  ///Converts map to the respective items.

  TodoModel.fromMap(Map<String, dynamic> map)
      : taskId = map['id'],
        taskName = map['taskName'] as String;

  ///Id of the Task....
  final int taskId;

  ///Name of the task....
  final String taskName;
}
