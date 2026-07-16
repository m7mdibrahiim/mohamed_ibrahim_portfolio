import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/contact/presentation/contact_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/projects/presentation/project_details_page.dart';
import '../../features/projects/presentation/projects_page.dart';
import '../theme/app_colors.dart';
import 'route_names.dart';

class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AppRouteNames.home,
        path: '/',
        pageBuilder: (context, state) => _buildPage(
          state: state,
          child: HomePage(
            initialSection: state.uri.queryParameters['section'],
          ),
        ),
      ),
      GoRoute(
        name: AppRouteNames.projects,
        path: '/projects',
        pageBuilder: (context, state) => _buildPage(
          state: state,
          child: const ProjectsPage(),
        ),
      ),
      GoRoute(
        name: AppRouteNames.projectDetails,
        path: '/projects/:id',
        pageBuilder: (context, state) {
          final projectId = state.pathParameters['id']?.trim() ?? '';
          return _buildPage(
            state: state,
            pageKey: ValueKey<String>('project-page-$projectId'),
            child: ProjectDetailsPage(
              key: ValueKey<String>('project-details-$projectId'),
              projectId: projectId,
            ),
          );
        },
      ),
      GoRoute(
        name: AppRouteNames.contact,
        path: '/contact',
        pageBuilder: (context, state) => _buildPage(
          state: state,
          child: const ContactPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => _buildPage(
      state: state,
      child: const _NotFoundPage(),
    ),
  );

  static CustomTransitionPage<void> _buildPage({
    required GoRouterState state,
    required Widget child,
    LocalKey? pageKey,
  }) {
    return CustomTransitionPage<void>(
      key: pageKey ?? state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 420),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.025),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}

class _NotFoundPage extends StatelessWidget {
  const _NotFoundPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Center(
        child: Text(
          'Page not found',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
