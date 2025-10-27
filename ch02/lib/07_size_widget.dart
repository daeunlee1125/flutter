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
      home: const MyHomePage(title: '07. 위젯 크기 실습'),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        // 메인 축과 수직인 축
        // 그니까 Column에서는 가로 배치가 crossAxis겠죠!?
        children: [
          // IntrinsicWidth : 같은 배치 관계에서 너비가 가장 큰 자식 위젯을 기준으로, 부모의 너비가 결정됨
          Container(
            color: Colors.yellow,
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(color: Colors.red, width: 100, height: 100, child: Text('A'),),
                  Container(color: Colors.blue, width: 200, height: 150, child: Text('B'),),
                  Container(color: Colors.green, width: 250, height: 70, child: Text('C'),),
                ],
              ),
            ),
          ),

          // IntrinsicHeight
          Container(
            color: Colors.yellow,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(color: Colors.red, width: 100, height: 100, child: Text('A'),),
                  Container(color: Colors.blue, width: 200, height: 150, child: Text('B'),),
                  Container(color: Colors.green, width: 100, height: 70, child: Text('C'),),
                ],
              ),
            ),
          )
        ],
      )

    );
  }
}
