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
          // Row : 내부의 위젯들을 가로로 배치하는 위젯
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              )
            ],
          ),
          
          // Column : 내부의 위젯들을 세로로 배치하는 위젯
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              )
            ],
          ),
          
          Row(
            children: [
              Column(
                children: [
                  Text('벚꽃'),
                  Image.asset('images/flower1.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,)
                ],
              ),
              Column(
                children: [
                  Text('코스모스'),
                  Image.asset('images/flower2.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,)
                ],
              ),
              Column(
                children: [
                  Text('해바라기'),
                  Image.asset('images/flower3.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,)
                ],
              )
            ],

          ),

          Container(
            width: 400,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(width: 2)
            ),
            margin: EdgeInsets.symmetric(vertical: 10), // 위, 아래 여백 10
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // 기본축 정렬
              crossAxisAlignment: CrossAxisAlignment.stretch, // 교차축 정렬
              children: [
                Container(width: 50,
                height: 80,
                color: Colors.redAccent,),
                Container(width: 50,
                  height: 50,
                  color: Colors.greenAccent,),
                Container(width: 50,
                  height: 80,
                  color: Colors.blueAccent,)
              ],
            ),
          )


        ],

      )

    );
  }
}
