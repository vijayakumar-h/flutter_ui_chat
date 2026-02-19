import 'common_exports.dart';

class DrawingApp extends StatelessWidget {
  const DrawingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BlocBuilder<DrawingCubit, DrawingState>(
            builder: (context, state) {
              return GestureDetector(
                onPanUpdate: (details) => context
                    .read<DrawingCubit>()
                    .addPoint(details.localPosition),
                onPanEnd: (_) => context.read<DrawingCubit>().addPoint(null),
                child: RepaintBoundary(
                  child: CustomPaint(
                    painter: SketchPainter(state.points),
                    size: Size.infinite,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 60,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "undo",
                  mini: true,
                  backgroundColor: Colors.white,
                  onPressed: () => context.read<DrawingCubit>().undo(),
                  child: const Icon(Icons.undo, color: Colors.blueAccent),
                ),
                const SizedBox(height: 12),
                FloatingActionButton(
                  heroTag: "clear",
                  mini: true,
                  backgroundColor: Colors.redAccent,
                  onPressed: () => context.read<DrawingCubit>().clear(),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}