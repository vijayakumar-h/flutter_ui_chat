import 'package:flutter_ui_chat/src/common_url_services.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskController repository;

  TaskBloc(this.repository) : super(TaskLoading()) {
    on<LoadTask>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await repository.fetchTask();
        emit(TaskLoaded(task: tasks));
      } catch (e) {
        emit(TaskError(message: e.toString()));
      }
    });

    on<CreateTask>((event, emit) async {
      try {
        await repository.createTask(event.task);
        add(LoadTask());
      } catch (e) {
        emit(TaskError(message: 'Failed to add task'));
      }
    });

    on<RemoveTask>((event, emit) async {
      try {
        await repository.deleteTask(event.taskId);
        add(LoadTask());
      } catch (e) {
        emit(TaskError(message: 'Failed to delete'));
      }
    });
  }
}
