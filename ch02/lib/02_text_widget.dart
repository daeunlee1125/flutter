import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'i am title',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Daeun\'s Flutter Demo Home Page'),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 일반 텍스트 위젯
          Text(
            'Hello World',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent
            ),),
          Text('동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세!',
            style: TextStyle(
              fontSize: 16,
              overflow: TextOverflow.ellipsis
            )
          ),
          // 문자열 문자 스타일
          Text.rich(
            TextSpan(
                text: 'HE',
                children: [
                  TextSpan(text: 'LLO', style: TextStyle(color: Colors.red)),
                  TextSpan(text: 'WOR', style: TextStyle(color: Colors.blue)),
                  TextSpan(text: 'LD', style: TextStyle(color: Colors.green))
                ]
            )
          )
        ],

      )

    );
  }
}
