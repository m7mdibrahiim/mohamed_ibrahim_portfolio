import 'package:flutter/material.dart';

import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/footer.dart';
import '../widgets/contact_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPageScaffold(
      activeNav: 'contact',
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: ContactSection()),
          SliverToBoxAdapter(child: AppFooter()),
        ],
      ),
    );
  }
}
