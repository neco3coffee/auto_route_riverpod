import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_route_riverpod/data/auth_controller.dart';
import 'package:go_route_riverpod/data/models/book.dart';
import 'package:go_route_riverpod/ui/route/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookAuthorController = useTextEditingController();
    final bookTitleController = useTextEditingController();
    final isAuthenticated = ref.watch(authControllerProvider) != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isAuthenticated ? 'isAuthenticated' : 'not Authenticated'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('home page'),
            ElevatedButton(
              onPressed: () =>
                  ref.read(authControllerProvider.notifier).signOut(),
              child: Text('signOut'),
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(authControllerProvider.notifier).signIn(),
              child: Text('signIn'),
            ),
            ElevatedButton(
              onPressed: () => context.router.pushNamed('/login-page'),
              child: Text('pushNamed=> login-page'),
            ),
            ElevatedButton(
              onPressed: () => context.router.pop(),
              child: Text('pop=>'),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: bookAuthorController,
                decoration: InputDecoration(hintText: 'book author'),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: bookTitleController,
                decoration: InputDecoration(hintText: 'book title'),
              ),
            ),
            ElevatedButton(
              onPressed: () => context.router.push(BookDetailRoute(
                  book: Book(
                      bookAuthorController.text, bookTitleController.text))),
              child: Text('=> BookDetailPage'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () => context.router.pushNamed('/dashboard'),
              child: Text('=> DashboardPage'),
            ),
          ],
        ),
      ),
    );
  }
}
