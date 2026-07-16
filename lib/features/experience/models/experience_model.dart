import 'package:flutter/widgets.dart';

import '../../../core/responsive/context_extensions.dart';

class ExperienceModel {
  const ExperienceModel({
    required this.roleEn,
    required this.roleAr,
    required this.company,
    required this.period,
    required this.summaryEn,
    required this.summaryAr,
    required this.bulletsEn,
    required this.bulletsAr,
    required this.techStack,
  });

  final String roleEn;
  final String roleAr;
  final String company;
  final String period;
  final String summaryEn;
  final String summaryAr;
  final List<String> bulletsEn;
  final List<String> bulletsAr;
  final List<String> techStack;

  String role(BuildContext context) => context.isAr ? roleAr : roleEn;
  String summary(BuildContext context) => context.isAr ? summaryAr : summaryEn;
  List<String> bullets(BuildContext context) => context.isAr ? bulletsAr : bulletsEn;
}
