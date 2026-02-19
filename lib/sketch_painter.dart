import 'common_exports.dart';

class SketchPainter extends CustomPainter {
  final List<Offset?> points;

  SketchPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant SketchPainter oldDelegate) {
    return oldDelegate.points.length != points.length;
  }
}
