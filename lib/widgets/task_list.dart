import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/task_tile.dart';
import 'package:flutter_todo_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              longPressDelete: () {
                taskData.deleteTask(task);
              },
              checkboxCallback: (newValue) {
                taskData.updateTask(task, newValue);
              },
            );
          },
        );
      },
    );
  }
}
