import 'package:flutter/material.dart';
import 'package:go_route_riverpod/ui/route/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authGuard = ref.read(authGuardProvider);
    final appRouter = AppRouter(authGuard: authGuard);

    return MaterialApp.router(
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
