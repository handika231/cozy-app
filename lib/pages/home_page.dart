import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const nameRoute = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('This is Home Page'),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
