import 'package:flutter_ui_chat/src/common_url_services.dart';

abstract class TaskEvent {}

class LoadTask extends TaskEvent {}

class CreateTask extends TaskEvent {
  final Task task;

  CreateTask({required this.task});
}

class RemoveTask extends TaskEvent {
  final int taskId;

  RemoveTask({required this.taskId});
}
