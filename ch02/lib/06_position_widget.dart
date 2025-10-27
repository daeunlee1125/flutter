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
      home: const MyHomePage(title: '06. 위치 관련 위젯 실습'),
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

          // Align : 특정 위치에 배치하기
          Container(
            width: double.infinity, // 가로 화면 100%
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.4),
              border: Border.all(width: 1, color: Colors.pinkAccent)
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),

          // FractionalOffset : 특정 위치 좌표로 배치하기
          Container(
            width: double.infinity, // 가로 화면 100%
            height: 200,
            decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.4),
                border: Border.all(width: 1, color: Colors.pinkAccent)
            ),
            child: Align(
              alignment: FractionalOffset(0.2, 0.7), 
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),

          // Stack : 위젯을 겹쳐서 배치
          Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),

              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),

              Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ],
          ),

          // IndexedStack : 위젯을 겹쳐서 배치하고, 인덱스 번호로 화면에 표시
          IndexedStack(
            index: 2,
            children: [
              Text('첫 번째 텍스트', style: TextStyle(fontSize: 24),),
              Text('두 번째 텍스트', style: TextStyle(fontSize: 24),),
              Text('세 번째 텍스트', style: TextStyle(fontSize: 24),),
            ],
          ),

          // Positioned
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 1)
            ),
            child: Stack(
              children: [
                Positioned(
                  // Positioned 위젯은 반드시 Stack 위젯의 자식 위젯으로 사용
                  left:10,
                  top: 10,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  )
                ),
                Positioned( // Positioned 위젯은 반드시 Stack 위젯의 자식 위젯으로 사용
                    right:10,
                    bottom: 10,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    )
                )
              ],
            ),
          ),

        ],
      )

    );
  }
}
