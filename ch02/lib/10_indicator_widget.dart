import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: '10. 로딩중 인디케이터 위젯'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Text('원형 인디케이터'),
          CircularProgressIndicator(),
          SizedBox(
            height: 40,
          ),
          CircularProgressIndicator(
            strokeWidth: 10,
            valueColor: AlwaysStoppedAnimation(Colors.red),
            value: 0.7, // 진행률! value 없으면 무한 회전함
          ),
          SizedBox(
            height: 40,
          ),
          LinearProgressIndicator(),
          SizedBox(
            height: 40,
          ),
          LinearProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.grey,
            color: Colors.blueAccent,
            minHeight: 10,
          )
        ],
      )

    );
  }
}
