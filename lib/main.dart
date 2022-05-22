import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_route_riverpod/data/auth_controller.dart';
import 'package:go_route_riverpod/ui/home_page.dart';
import 'package:go_route_riverpod/ui/login_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authControllerProvider) != null;
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: isAuthenticated ? HomePage() : LoginPage(),
      ),
    );
  }
}
