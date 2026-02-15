import 'package:flutter_ui_chat/src/bloc.dart';
import 'package:flutter_ui_chat/src/common_url_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('TODO app'),
        ),
        body: BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
          if (state is TaskLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TaskError) {
            return Center(child: Text(state.message));
          }
          if (state is TaskLoaded) {
            return ListView.builder(
                itemCount: state.task.length,
                itemBuilder: (context, index) {
                  final task = state.task[index];
                  return ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.description),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => context.read<TaskBloc>().add(
                            RemoveTask(taskId: task.id!),
                          ),
                    ),
                  );
                });
          }
          return SizedBox.shrink();
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final newTask =
                Task(title: "New Task", description: "Created via BLoC");
            context.read<TaskBloc>().add(CreateTask(task: newTask));
          },
          child: Icon(Icons.add),
        ),
      );
}
