import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tobeto Workshop",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey[600],
        ),
        backgroundColor: Colors.grey[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/emir.jpg"),
            _customText(
                text: "Emir Taşçakır", size: 22, weigth: FontWeight.w700),
            _customText(
                text: "Tobeto - Mobil Geliştirici - 1B",
                size: 20,
                weigth: FontWeight.w600),
            _customText(text: "31.10.2023", size: 18, weigth: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}

class _customText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weigth;
  const _customText(
      {required this.text, required this.size, required this.weigth});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: weigth),
    );
  }
}
