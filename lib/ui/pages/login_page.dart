import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:go_route_riverpod/data/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authControllerProvider) != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isAuthenticated ? 'isAuthenticated' : 'not Authenticated'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('login page'),
            ElevatedButton(
              onPressed: () =>
                  ref.read(authControllerProvider.notifier).signIn(),
              child: Text('signIn'),
            ),
            ElevatedButton(
              onPressed: () => context.router.pushNamed('/'),
              child: Text('pushNamed=> home'),
            )
          ],
        ),
      ),
    );
  }
}
