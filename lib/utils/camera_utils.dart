import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImageWithCountdown(BuildContext context, ImageSource source) async {
  if (source == ImageSource.gallery) {
    return ImagePicker().pickImage(source: source, maxWidth: 1080, imageQuality: 85);
  }
  if (!context.mounted) return null;
  await showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black87,
    builder: (_) => const CountdownDialog(),
  );
  if (!context.mounted) return null;
  return ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 1080, imageQuality: 85);
}

class CountdownDialog extends StatefulWidget {
  const CountdownDialog({super.key});
  @override
  State<CountdownDialog> createState() => _CountdownDialogState();
}

class _CountdownDialogState extends State<CountdownDialog> {
  int _count = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_count <= 1) {
        t.cancel();
        if (mounted) Navigator.of(context).pop();
      } else {
        if (mounted) setState(() => _count--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$_count',
        style: const TextStyle(fontSize: 120, fontWeight: FontWeight.w900, color: Colors.white),
      ),
    );
  }
}
