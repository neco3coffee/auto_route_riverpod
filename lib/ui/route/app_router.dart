import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:go_route_riverpod/data/auth_controller.dart';
import 'package:go_route_riverpod/data/models/book.dart';
import 'package:go_route_riverpod/ui/pages/book_detail_page.dart';
import 'package:go_route_riverpod/ui/pages/dashboard/dash_board_page.dart';
import 'package:go_route_riverpod/ui/pages/dashboard/posts_page.dart';
import 'package:go_route_riverpod/ui/pages/dashboard/settings_page.dart';
import 'package:go_route_riverpod/ui/pages/dashboard/users_page.dart';
import 'package:go_route_riverpod/ui/pages/home_page.dart';
import 'package:go_route_riverpod/ui/pages/login_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'app_router.gr.dart';

final authGuardProvider = Provider<AuthGuard>((ref) => AuthGuard(ref.read));

class AuthGuard extends AutoRouteGuard {
  final Reader _reader;
  AuthGuard(this._reader);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated = _reader(authControllerProvider) != null;
    final guardedRoute = resolver.route;

    if (isAuthenticated) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, guards: [AuthGuard], initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: BookDetailPage),
    AutoRoute(
        path: '/dashboard',
        guards: [AuthGuard],
        page: DashboardPage,
        children: [
          AutoRoute(path: 'users', page: UsersPage),
          AutoRoute(path: 'posts', page: PostsPage),
          AutoRoute(path: 'settings', page: SettingsPage),
        ])
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}
