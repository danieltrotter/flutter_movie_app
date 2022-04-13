import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/pages/main_page.dart';
import 'package:movie_app/view_controllers/movie_controller.dart';

Future<void> main() async {
  await _controllerBinding();
  runApp(const MyApp());
}

_controllerBinding() {
  Get.lazyPut<MovieViewController>(() => MovieViewController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
