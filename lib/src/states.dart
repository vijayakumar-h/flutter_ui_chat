import 'package:flutter_ui_chat/src/common_url_services.dart';

abstract class TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> task;

  TaskLoaded({required this.task});
}

class TaskError extends TaskState {
  final String message;

  TaskError({required this.message});
}
