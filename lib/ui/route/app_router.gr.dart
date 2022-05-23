// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    BookDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BookDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: BookDetailPage(key: args.key, book: args.book));
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: DashboardPage());
    },
    UsersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UsersPage());
    },
    PostsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PostsPage());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', guards: [authGuard]),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(BookDetailRoute.name, path: '/book-detail-page'),
        RouteConfig(DashboardRoute.name, path: '/dashboard', guards: [
          authGuard
        ], children: [
          RouteConfig(UsersRoute.name,
              path: 'users', parent: DashboardRoute.name),
          RouteConfig(PostsRoute.name,
              path: 'posts', parent: DashboardRoute.name),
          RouteConfig(SettingsRoute.name,
              path: 'settings', parent: DashboardRoute.name)
        ])
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [BookDetailPage]
class BookDetailRoute extends PageRouteInfo<BookDetailRouteArgs> {
  BookDetailRoute({Key? key, required Book book})
      : super(BookDetailRoute.name,
            path: '/book-detail-page',
            args: BookDetailRouteArgs(key: key, book: book));

  static const String name = 'BookDetailRoute';
}

class BookDetailRouteArgs {
  const BookDetailRouteArgs({this.key, required this.book});

  final Key? key;

  final Book book;

  @override
  String toString() {
    return 'BookDetailRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(DashboardRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [UsersPage]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute() : super(UsersRoute.name, path: 'users');

  static const String name = 'UsersRoute';
}

/// generated route for
/// [PostsPage]
class PostsRoute extends PageRouteInfo<void> {
  const PostsRoute() : super(PostsRoute.name, path: 'posts');

  static const String name = 'PostsRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}
