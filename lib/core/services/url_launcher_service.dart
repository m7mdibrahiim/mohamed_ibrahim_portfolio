import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  const UrlLauncherService._();

  static Future<void> open(String url, {BuildContext? context}) async {
    final parsed = Uri.tryParse(url);
    if (parsed == null) {
      _showError(context, 'Invalid link');
      return;
    }
    final uri = _resolveUri(parsed, url);
    try {
      final didLaunch = await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
        webOnlyWindowName: kIsWeb ? '_blank' : null,
      );
      if (!didLaunch) _showError(context, 'Could not open link');
    } catch (_) {
      _showError(context, 'Could not open link');
    }
  }

  static Uri _resolveUri(Uri parsed, String rawUrl) {
    if (parsed.hasScheme) return parsed;

    // Flutter web exposes declared assets at assets/assets/... . When the user
    // is on /projects/:id, resolving a plain relative URL would incorrectly
    // point to /projects/assets/.... This keeps asset links stable while still
    // supporting a one-segment GitHub Pages base path such as /portfolio/.
    if (rawUrl.startsWith('assets/')) {
      final base = Uri.base;
      final pathSegments = base.pathSegments.where((segment) => segment.isNotEmpty).toList(growable: false);
      const topLevelRoutes = {'projects', 'contact'};
      final prefix = pathSegments.isNotEmpty && !topLevelRoutes.contains(pathSegments.first) ? '/${pathSegments.first}/' : '/';
      return base.replace(path: '$prefix$rawUrl', query: '', fragment: '');
    }

    return Uri.base.resolve(rawUrl);
  }

  static void _showError(BuildContext? context, String message) {
    if (context == null || !context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
