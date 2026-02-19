import 'common_exports.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => DrawingCubit(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DrawingApp(),
        ),
      ),
    );

class DrawingState {
  final List<Offset?> points;

  DrawingState(this.points);
}

class DrawingCubit extends Cubit<DrawingState> {
  DrawingCubit() : super(DrawingState([]));

  void addPoint(Offset? point) {
    emit(DrawingState(List<Offset?>.from(state.points)..add(point)));
  }

  void undo() {
    if (state.points.isEmpty) return;

    List<Offset?> newPoints = List<Offset?>.from(state.points);
    if (newPoints.isNotEmpty && newPoints.last == null) {
      newPoints.removeLast();
    }
    while (newPoints.isNotEmpty && newPoints.last != null) {
      newPoints.removeLast();
    }

    emit(DrawingState(newPoints));
  }

  void clear() => emit(DrawingState([]));
}
