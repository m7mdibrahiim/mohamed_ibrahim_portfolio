import 'package:flutter/material.dart';

class ProjectVideoSurface extends StatefulWidget {
  const ProjectVideoSurface({
    super.key,
    required this.videoPath,
    required this.loadingLabel,
    required this.onError,
    this.posterPath,
  });

  final String videoPath;
  final String? posterPath;
  final String loadingLabel;
  final VoidCallback onError;

  @override
  State<ProjectVideoSurface> createState() => _ProjectVideoSurfaceState();
}

class _ProjectVideoSurfaceState extends State<ProjectVideoSurface> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.onError());
  }

  @override
  Widget build(BuildContext context) => const SizedBox.expand();
}
