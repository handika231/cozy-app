import 'package:cozy_app/service/api_service.dart';
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
      body: Center(
        child: FutureBuilder(
          future: ApiService.getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            return const CircularProgressIndicator();
            // if (snapshot.data == null ||
            //     snapshot.connectionState == ConnectionState.waiting) {
            //   return const CircularProgressIndicator();
            // } else {
            //   return Text(snapshot.data);
            // }
          },
        ),
      ),
    );
  }
}
