import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('users'),
          ElevatedButton(
              onPressed: () => context.router.pop(), child: Text('pop'))
        ],
      ),
    );
  }
}
