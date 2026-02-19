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

class Stroke {
  final List<Offset?> points;
  final Color color;

  Stroke({
    required this.color,
    required this.points,
  });
}

class DrawingState {
  final List<Stroke> strokes;
  final Color selectedColor;

  DrawingState({
    required this.strokes,
    required this.selectedColor,
  });

  DrawingState copyWith({List<Stroke>? strokes, Color? selectedColor}) {
    return DrawingState(
      strokes: strokes ?? this.strokes,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}

class DrawingCubit extends Cubit<DrawingState> {
  DrawingCubit()
      : super(DrawingState(strokes: [], selectedColor: Colors.black));

  void changeColor(Color color) {
    emit(state.copyWith(selectedColor: color));
  }

  void startStroke(Offset points) {
    final newStroke = Stroke(
      points: [points],
      color: state.selectedColor,
    );
    final List<Stroke> newStrokes = List.from(state.strokes)..add(newStroke);
    emit(state.copyWith(strokes: newStrokes));
  }

  void updateStroke(Offset point) {
    if (state.strokes.isEmpty) return;

    final List<Stroke> newStrokes = List.from(state.strokes);
    final lastStroke = newStrokes.last;

    // Add point to the last stroke
    final updatedPoints = List<Offset?>.from(lastStroke.points)..add(point);
    newStrokes[newStrokes.length - 1] =
        Stroke(points: updatedPoints, color: lastStroke.color);

    emit(state.copyWith(strokes: newStrokes));
  }

  void undo() {
    if (state.strokes.isEmpty) return;
    emit(state.copyWith(strokes: List.from(state.strokes)..removeLast()));
  }

  void clear() => emit(state.copyWith(strokes: []));
}
