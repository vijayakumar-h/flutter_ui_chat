import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_ui_chat/main.dart';

void main() {
  group('DrawingCubit', () {
    late DrawingCubit drawingCubit;

    setUp(() {
      drawingCubit = DrawingCubit();
    });

    tearDown(() {
      drawingCubit.close();
    });

    test('initial state is correct', () {
      expect(drawingCubit.state.strokes, isEmpty);
      expect(drawingCubit.state.selectedColor, Colors.black);
    });

    blocTest<DrawingCubit, DrawingState>(
      'changeColor updates selectedColor',
      build: () => drawingCubit,
      act: (cubit) => cubit.changeColor(Colors.red),
      expect: () => [
        predicate<DrawingState>((state) => state.selectedColor == Colors.red),
      ],
    );

    blocTest<DrawingCubit, DrawingState>(
      'startStroke adds a new stroke',
      build: () => drawingCubit,
      act: (cubit) => cubit.startStroke(const Offset(10, 10)),
      expect: () => [
        predicate<DrawingState>((state) {
          return state.strokes.length == 1 &&
              state.strokes.first.points.length == 1 &&
              state.strokes.first.points.first == const Offset(10, 10);
        }),
      ],
    );

    blocTest<DrawingCubit, DrawingState>(
      'updateStroke adds points to the last stroke',
      build: () => drawingCubit,
      seed: () => DrawingState(
        strokes: [
          Stroke(color: Colors.black, points: [const Offset(10, 10)])
        ],
        selectedColor: Colors.black,
      ),
      act: (cubit) => cubit.updateStroke(const Offset(20, 20)),
      expect: () => [
        predicate<DrawingState>((state) {
          return state.strokes.length == 1 &&
              state.strokes.first.points.length == 2 &&
              state.strokes.first.points.last == const Offset(20, 20);
        }),
      ],
    );

    blocTest<DrawingCubit, DrawingState>(
      'undo removes the last stroke',
      build: () => drawingCubit,
      seed: () => DrawingState(
        strokes: [
          Stroke(color: Colors.black, points: [const Offset(10, 10)])
        ],
        selectedColor: Colors.black,
      ),
      act: (cubit) => cubit.undo(),
      expect: () => [
        predicate<DrawingState>((state) => state.strokes.isEmpty),
      ],
    );

    blocTest<DrawingCubit, DrawingState>(
      'clear removes all strokes',
      build: () => drawingCubit,
      seed: () => DrawingState(
        strokes: [
          Stroke(color: Colors.black, points: [const Offset(10, 10)]),
          Stroke(color: Colors.red, points: [const Offset(30, 30)])
        ],
        selectedColor: Colors.black,
      ),
      act: (cubit) => cubit.clear(),
      expect: () => [
        predicate<DrawingState>((state) => state.strokes.isEmpty),
      ],
    );
  });
}
