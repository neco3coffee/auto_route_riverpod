import 'package:flutter/material.dart';
import 'package:go_route_riverpod/data/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('login page'),
          ElevatedButton(
              onPressed: () =>
                  ref.read(authControllerProvider.notifier).signIn(),
              child: Text('signIn'))
        ],
      ),
    );
  }
}
