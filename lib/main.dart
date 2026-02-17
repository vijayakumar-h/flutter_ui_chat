import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      const MaterialApp(
        home: BlocProviderExample(),
      ),
    );

class BlocProviderExample extends StatelessWidget {
  const BlocProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Model3DBloc(),
      child: const Model3DScreen(),
    );
  }
}

class Model3DScreen extends StatefulWidget {
  const Model3DScreen({super.key});

  @override
  State<Model3DScreen> createState() => _Model3DScreenState();
}

class _Model3DScreenState extends State<Model3DScreen> {
  final Flutter3DController controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 3D + BLoC')),
      body: BlocListener<Model3DBloc, Model3DState>(
        // Listen for state changes to trigger controller actions
        listener: (context, state) {
          if (state.activeAnimation != null) {
            controller.playAnimation(animationName: state.activeAnimation);
          }

          if (state.isRotating) {
            controller.setCameraOrbit(20, 20, 20); // Example movement
          }
        },
        child: Column(
          children: [
            // 3D Viewer Area
            Expanded(
              child: Flutter3DViewer(
                controller: controller,
                src:
                    'assets/business_man.glb', // Ensure this is in pubspec.yaml
              ),
            ),

            // Control Panel
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Column(
                children: [
                  const Text("Animations",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildAnimButton(context, 'Walk', Colors.blue),
                      _buildAnimButton(context, 'Run', Colors.green),
                      _buildAnimButton(context, 'Idle', Colors.orange),
                    ],
                  ),
                  const Divider(),
                  ElevatedButton.icon(
                    onPressed: () =>
                        context.read<Model3DBloc>().add(ToggleRotationEvent()),
                    icon: const Icon(Icons.rotate_right),
                    label: const Text("Rotate Model"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimButton(BuildContext context, String name, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, foregroundColor: Colors.white),
      onPressed: () =>
          context.read<Model3DBloc>().add(PlayAnimationEvent(name)),
      child: Text(name),
    );
  }
}

// --- Events ---
abstract class Model3DEvent {}

class PlayAnimationEvent extends Model3DEvent {
  final String animationName;

  PlayAnimationEvent(this.animationName);
}

class ToggleRotationEvent extends Model3DEvent {}

// --- State ---
class Model3DState {
  final String? activeAnimation;
  final bool isRotating;

  Model3DState({this.activeAnimation, this.isRotating = false});

  Model3DState copyWith({String? activeAnimation, bool? isRotating}) {
    return Model3DState(
      activeAnimation: activeAnimation ?? this.activeAnimation,
      isRotating: isRotating ?? this.isRotating,
    );
  }
}

// --- BLoC ---
class Model3DBloc extends Bloc<Model3DEvent, Model3DState> {
  Model3DBloc() : super(Model3DState()) {
    on<PlayAnimationEvent>((event, emit) {
      emit(state.copyWith(activeAnimation: event.animationName));
    });

    on<ToggleRotationEvent>((event, emit) {
      emit(state.copyWith(isRotating: !state.isRotating));
    });
  }
}
