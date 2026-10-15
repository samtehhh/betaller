import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../utils/constants.dart';
import '../utils/exercise_guides.dart';
import 'exercise_animation.dart';

/// Shows how a move is done: the bundled loop for it (silent, repeating,
/// poster first so there is never a black box), a drawn illustration where
/// no clip exists, and the old animated figure as the last fallback.
class ExerciseMedia extends StatefulWidget {
  final String routineId;
  final Color color;
  final double height;

  const ExerciseMedia({
    super.key,
    required this.routineId,
    required this.color,
    this.height = 320,
  });

  static bool hasClip(String id) => kExerciseMedia.contains(id);
  static String posterFor(String id) => 'assets/exercises/$id.jpg';

  @override
  State<ExerciseMedia> createState() => _ExerciseMediaState();
}

class _ExerciseMediaState extends State<ExerciseMedia> {
  VideoPlayerController? _video;

  @override
  void initState() {
    super.initState();
    if (ExerciseMedia.hasClip(widget.routineId)) {
      final c = VideoPlayerController.asset(
        'assets/exercises/${widget.routineId}.mp4',
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
      _video = c;
      c.setLooping(true);
      c.setVolume(0);
      c.initialize().then((_) {
        if (!mounted) return;
        if (!MediaQuery.of(context).disableAnimations) c.play();
        setState(() {});
      }).catchError((_) {});
    }
  }

  @override
  void dispose() {
    _video?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.routineId;
    Widget child;
    final v = _video;
    if (v != null) {
      child = Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(ExerciseMedia.posterFor(id), fit: BoxFit.cover),
          if (v.value.isInitialized)
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: v.value.size.width,
                height: v.value.size.height,
                child: VideoPlayer(v),
              ),
            ),
          // Tap to pause or resume.
          Positioned.fill(
            child: GestureDetector(
              onTap: () => setState(
                () => v.value.isPlaying ? v.pause() : v.play(),
              ),
            ),
          ),
        ],
      );
    } else if (id == 'wall_stand') {
      child = const WallStandIllustration();
    } else {
      child = ExerciseAnimationWidget(routineId: id, color: widget.color);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: widget.height,
        width: double.infinity,
        child: ColoredBox(color: AppColors.cardFill, child: child),
      ),
    );
  }
}

/// A figure standing against a wall with the five points that should touch
/// it: head, shoulder blades, bottom, calves, heels.
class WallStandIllustration extends StatelessWidget {
  const WallStandIllustration({super.key});

  @override
  Widget build(BuildContext context) =>
      CustomPaint(painter: _WallPainter(), size: Size.infinite);
}

class _WallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height * 0.84;
    final top = size.height * 0.08;
    final wallX = size.width * 0.58;
    // Wall and floor.
    canvas.drawRect(
      Rect.fromLTWH(wallX, 0, size.width - wallX, size.height),
      Paint()..color = Colors.white.withValues(alpha: 0.06),
    );
    canvas.drawLine(
      Offset(wallX, 0),
      Offset(wallX, size.height),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.35)
        ..strokeWidth = 2,
    );
    canvas.drawLine(
      Offset(0, top + h),
      Offset(size.width, top + h),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.2)
        ..strokeWidth = 1.5,
    );

    // Side-view figure, back flat to the wall.
    final u = h / 7.5;
    final back = wallX - 2;
    final body = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white.withValues(alpha: 0.9), AppColors.primaryLight],
      ).createShader(Rect.fromLTWH(0, top, size.width, h));
    final path = Path()
      ..addOval(Rect.fromLTWH(back - u * 0.86, top, u * 0.86, u))
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(back - u * 0.52, top + u * 0.9, u * 0.34, u * 0.4),
        Radius.circular(u * 0.1),
      ))
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(back - u * 0.95, top + u * 1.25, u * 0.95, u * 2.55),
        Radius.circular(u * 0.35),
      ))
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(back - u * 0.78, top + u * 3.7, u * 0.78, u * 3.6),
        Radius.circular(u * 0.3),
      ))
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(back - u * 1.2, top + h - u * 0.22, u * 1.2, u * 0.22),
        Radius.circular(u * 0.1),
      ))
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(back - u * 0.62, top + u * 1.4, u * 0.3, u * 2.4),
        Radius.circular(u * 0.15),
      ));
    canvas.drawPath(path, body);

    // The five contact points.
    final dot = Paint()..color = AppColors.lime;
    final glow = Paint()
      ..color = AppColors.lime.withValues(alpha: 0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    for (final y in [0.45, 1.8, 3.75, 5.6, 7.3]) {
      final c = Offset(wallX, top + u * y);
      canvas.drawCircle(c, 9, glow);
      canvas.drawCircle(c, 4.5, dot);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
