import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? taskTitle;
  final Function(bool?)? checkboxCallback;
  final VoidCallback? longPressDelete;

  const TaskTile({
    super.key,
    this.isChecked = false,
    this.taskTitle,
    this.checkboxCallback,
    this.longPressDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressDelete,
      trailing: Checkbox(
        activeColor: Colors.red,
        value: isChecked ?? false,
        onChanged: (newValue) {
          print('Checkbox toggled: $newValue');
          checkboxCallback!(newValue);
        },
      ),
      title: Text(
        taskTitle ?? 'Task Title',
        style: TextStyle(
          decoration: isChecked ?? false ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
