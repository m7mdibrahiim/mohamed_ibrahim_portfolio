import 'package:flutter/material.dart';
import '../../../core/responsive/context_extensions.dart';

class SkillGroupModel {
  const SkillGroupModel({
    required this.titleEn,
    required this.titleAr,
    required this.icon,
    required this.skills,
  });

  final String titleEn;
  final String titleAr;
  final IconData icon;
  final List<String> skills;

  String title(BuildContext context) => context.isAr ? titleAr : titleEn;
}
