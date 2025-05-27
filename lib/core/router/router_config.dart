import 'package:flutter_posteary/core/router/animations/router_fade_go.dart';
import 'package:flutter_posteary/core/router/router_names.dart';
import 'package:flutter_posteary/features/posts/presentation/pages/home/home_screen.dart';
import 'package:go_router/go_router.dart';

/// A class that defines the application's routing configuration using GoRouter.
///
/// This class sets up the initial location and defines the routes for the
/// application. Each route is associated with a name and a path, and
/// uses a builder function to return the corresponding screen widget.
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AppRouterName.home,
        path: '/',
        pageBuilder: (_, _) => buildTransitionPageGo(HomeScreen()),
      ),
    ],
  );
}
