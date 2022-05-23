import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:go_route_riverpod/data/models/book.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('book detail page'),
            ElevatedButton(
              onPressed: () => context.router.pushNamed('/'),
              child: Text('pushNamed=> home'),
            ),
            Text('book author : ${book.author}'),
            Text('book title : ${book.title}'),
          ],
        ),
      ),
    );
    ;
  }
}
