import 'package:bmi_calculator_flutter/screens/home.dart';
import 'package:bmi_calculator_flutter/screens/loading.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' :(context) => const Loading(),
        '/home' : (context) => const Home()
      },
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
    );
  }
}
