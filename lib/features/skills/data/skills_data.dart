import 'package:flutter/material.dart';

import '../models/skill_group_model.dart';

class SkillsData {
  const SkillsData._();

  static const List<SkillGroupModel> groups = [
    SkillGroupModel(
      titleEn: 'Flutter Core',
      titleAr: 'Flutter Core',
      icon: Icons.flutter_dash_rounded,
      skills: ['Flutter', 'Dart', 'Responsive UI', 'Animations', 'Custom Widgets', 'Performance Optimization'],
    ),
    SkillGroupModel(
      titleEn: 'Architecture',
      titleAr: 'Architecture',
      icon: Icons.account_tree_rounded,
      skills: ['Clean Architecture', 'MVVM', 'Clean Code', 'Reusable Components'],
    ),
    SkillGroupModel(
      titleEn: 'State Management',
      titleAr: 'State Management',
      icon: Icons.sync_alt_rounded,
      skills: ['Bloc', 'Provider'],
    ),
    SkillGroupModel(
      titleEn: 'Backend & Database',
      titleAr: 'Backend & Database',
      icon: Icons.storage_rounded,
      skills: ['RESTful API Integration', 'Firebase Auth', 'Firestore', 'Realtime Database', 'Firebase Storage', 'Supabase', 'SQLite', 'Hive', 'shared_preferences'],
    ),
    SkillGroupModel(
      titleEn: 'Payments',
      titleAr: 'Payments',
      icon: Icons.payments_rounded,
      skills: ['Paymob', 'Stripe', 'PayPal'],
    ),
    SkillGroupModel(
      titleEn: 'Tools',
      titleAr: 'Tools',
      icon: Icons.handyman_rounded,
      skills: ['Git', 'GitHub', 'JSON'],
    ),
    SkillGroupModel(
      titleEn: 'Soft Skills',
      titleAr: 'Soft Skills',
      icon: Icons.groups_rounded,
      skills: ['Teamwork', 'Communication', 'Time Management', 'Attention to Detail', 'Agile & Scrum', 'Self-learning'],
    ),
  ];
}
