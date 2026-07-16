import 'package:flutter/material.dart';

import '../../../core/widgets/mockups/browser_mockup.dart';
import '../../../core/widgets/mockups/desktop_mockup.dart';
import '../../../core/widgets/mockups/document_mockup.dart';
import '../../../core/widgets/mockups/phone_mockup.dart';
import '../models/project_model.dart';
import 'project_visual_placeholder.dart';

class ProjectMockupView extends StatelessWidget {
  const ProjectMockupView({
    super.key,
    required this.project,
    required this.image,
    this.width = 320,
  });

  final ProjectModel project;
  final String? image;
  final double width;

  @override
  Widget build(BuildContext context) {
    final resolvedImage = image?.trim();
    if (resolvedImage == null || resolvedImage.isEmpty) {
      return ProjectVisualPlaceholder(project: project, width: width);
    }

    if (_isPresentationBoard(resolvedImage)) {
      final resolvedWidth = width.clamp(300.0, 860.0).toDouble();
      return BrowserMockup(
        image: resolvedImage,
        width: resolvedWidth,
        imageFit: BoxFit.contain,
        imageAlignment: Alignment.center,
        compactChrome: resolvedWidth < 430,
      );
    }

    final mediaKind = project.mediaKindFor(resolvedImage);
    switch (mediaKind) {
      case ProjectMediaKind.browser:
        if (_isResponsiveMobileWebCapture(resolvedImage)) {
          final resolvedWidth = width.clamp(210.0, 390.0).toDouble();
          return BrowserMockup(
            image: resolvedImage,
            width: resolvedWidth,
            height: resolvedWidth * 1.72,
            imageFit: BoxFit.contain,
            imageAlignment: Alignment.topCenter,
            compactChrome: resolvedWidth < 280,
          );
        }
        final resolvedWidth = width.clamp(300.0, 860.0).toDouble();
        return BrowserMockup(
          image: resolvedImage,
          width: resolvedWidth,
          imageFit: BoxFit.contain,
          imageAlignment: Alignment.topCenter,
          compactChrome: resolvedWidth < 430,
        );
      case ProjectMediaKind.desktop:
        return DesktopMockup(
          image: resolvedImage,
          width: width.clamp(330.0, 860.0).toDouble(),
          imageFit: BoxFit.contain,
        );
      case ProjectMediaKind.document:
        return DocumentMockup(
          image: resolvedImage,
          width: width.clamp(260.0, 860.0).toDouble(),
          imageFit: BoxFit.contain,
          alignment: Alignment.topCenter,
        );
      case ProjectMediaKind.phone:
        return PhoneMockup(
          image: resolvedImage,
          width: width.clamp(148.0, 320.0).toDouble(),
          imageFit: BoxFit.contain,
          alignment: Alignment.topCenter,
        );
    }
  }

  bool _isResponsiveMobileWebCapture(String path) => path.contains('_mobile_');

  bool _isPresentationBoard(String path) =>
      path.contains('presentation_board') ||
      path.contains('workflow_board') ||
      path.contains('cover_board');
}
