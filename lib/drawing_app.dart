import 'common_exports.dart';

class DrawingApp extends StatelessWidget {
  const DrawingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> palette = [
      Colors.black,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BlocBuilder<DrawingCubit, DrawingState>(
            builder: (context, state) {
              return GestureDetector(
                onPanStart: (details) => context
                    .read<DrawingCubit>()
                    .startStroke(details.localPosition),
                onPanUpdate: (details) => context
                    .read<DrawingCubit>()
                    .updateStroke(details.localPosition),
                child: CustomPaint(
                  painter: SketchPainter(state.strokes),
                  size: Size.infinite,
                ),
              );
            },
          ),
          Positioned(
            top: 68,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: "undo",
                    mini: true,
                    backgroundColor: Colors.blueGrey,
                    onPressed: () => context.read<DrawingCubit>().undo(),
                    child: const Icon(Icons.undo, color: Colors.white),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10)
                          ],
                        ),
                        child: BlocBuilder<DrawingCubit, DrawingState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: palette.map((color) {
                                final bool isSelected =
                                    state.selectedColor == color;
                                return GestureDetector(
                                  onTap: () => context
                                      .read<DrawingCubit>()
                                      .changeColor(color),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    width: isSelected ? 35 : 25,
                                    height: isSelected ? 35 : 25,
                                    decoration: BoxDecoration(
                                      color: color,
                                      shape: BoxShape.circle,
                                      border: isSelected
                                          ? Border.all(
                                              color: Colors.grey, width: 3)
                                          : null,
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
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
          ),
        ],
      ),
    );
  }
}
