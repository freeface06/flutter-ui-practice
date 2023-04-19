import 'package:flutter/material.dart';

void main() => runApp(const FavoritePage());

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('FavoritePage'),
        ),
      ),
    );
  }
}
