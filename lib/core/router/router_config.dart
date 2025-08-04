import 'package:flutter/material.dart';
import 'package:flutter_posteary/core/router/animations/router_fade_go.dart';
import 'package:flutter_posteary/core/router/router_names.dart';
import 'package:flutter_posteary/features/home/presentation/pages/home/home_screen.dart';
import 'package:flutter_posteary/features/login/presentation/pages/login/login_screen.dart';
import 'package:flutter_posteary/features/login/presentation/providers/login_provider.dart';
import 'package:flutter_posteary/features/posts/presentation/pages/posts/posts_screen.dart';
import 'package:flutter_posteary/features/profile/presentation/pages/profile/profile_screen.dart';
import 'package:flutter_posteary/shared/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// A map that associates integer keys with route names.
///
/// This map is used to define the relationship between numeric identifiers
/// and the corresponding route names within the application. Each key-value
/// pair links an integer to a specific route name from the `AppRouterName`
/// enumeration.
final routesList = {
  0: AppRouterName.home,
  1: AppRouterName.posts,
  2: AppRouterName.profile,
};

/// Provides a [GoRouter] instance configured with application routes and
/// navigation logic.
///
/// This provider sets up the routing for the application, including
/// authentication-based redirection. It initializes the router with an
/// initial location of '/login' and defines a redirect function to handle
/// navigation based on the user's authentication status. The router includes
/// a [ShellRoute] with a custom bottom navigation bar and several [GoRoute]
/// instances for different application screens.
///
/// The [authProvider] is used to determine the user's authentication status
/// and manage route access accordingly.
final routerProvider = Provider<GoRouter>((ref) {
  final token = ref.watch(authProvider);
  final isLoggedIn = token != null;

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final loggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !loggingIn) return '/login';
      if (isLoggedIn && loggingIn) return '/';
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          int selectedIndex = _selectIndex(state.uri.path);

          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBarCustom(
              selectedIndex: selectedIndex,
              onTap: (index) => context.goNamed(routesList[index]!),
            ),
          );
        },
        routes: [
          GoRoute(
            name: AppRouterName.home,
            path: '/',
            pageBuilder: (_, __) => buildTransitionPageGo(HomeScreen()),
          ),
          GoRoute(
            name: AppRouterName.posts,
            path: '/posts',
            pageBuilder: (_, __) => buildTransitionPageGo(PostsScreen()),
          ),
          GoRoute(
            name: AppRouterName.profile,
            path: '/profile',
            pageBuilder: (_, __) => buildTransitionPageGo(ProfileScreen()),
          ),
        ],
      ),
      GoRoute(
        name: AppRouterName.login,
        path: '/login',
        pageBuilder: (_, __) => buildTransitionPageGo(LoginScreen()),
      ),
    ],
  );
});

/// Determines the selected index based on the given path.
///
/// This function evaluates the provided path and returns an integer
/// representing the selected index. It checks if the path starts with
/// specific strings to determine the index:
/// - Returns 1 if the path starts with '/posts'.
/// - Returns 2 if the path starts with '/profile'.
/// - Defaults to 0 for any other path.
///
/// Args:
///   path (String): The path to evaluate.
///
/// Returns:
///   int: The index corresponding to the path.
int _selectIndex(String path) {
  int selectedIndex = 0;
  if (path.startsWith('/posts')) selectedIndex = 1;
  if (path.startsWith('/profile')) selectedIndex = 2;

  return selectedIndex;
}
