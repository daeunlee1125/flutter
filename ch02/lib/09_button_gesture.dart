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
      home: const MyHomePage(title: '09. 버튼 제스쳐 위젯'),
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
      // floatingActionButton : Scaffold 위젯 속성
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star_rate_outlined),
          onPressed: (){
            print('플로팅 버튼 클릭');

          }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: (){
                print('텍스트 버튼 클릭');
                },

              child: const Text('텍스트 버튼') // 메모리 효율성을 위해 const 선언
          ),
          
          // 아웃라인 버튼
          OutlinedButton(
              onPressed: (){
                print('아웃라인 버튼 클릭');
              }, 
              child: const Text('아웃라인 버튼')
          ),

          // 엘레베이트 버튼
          ElevatedButton(
              onPressed: (){
                print('엘리베이트 버튼 클릭');
              },
              child: const Text('엘리베이트 버튼')
          ),
          
          // 아이콘 버튼
          // 구글폰트에서 아이콘 검색해 보자!!
          IconButton(
              onPressed: (){
                print('아이콘 버튼 클릭');
              }, 
              icon: Icon(Icons.plus_one)
          ),

          // 제스쳐 감지 위젯
          GestureDetector(
            onTap: (){
              print('탭 제스쳐');
            },
            onDoubleTap: (){
              print('더블탭 제스쳐');
            },
            onLongPress: (){
              print('롱프레스 제스쳐');
            },
            child: Container(
              width: 400,
              height: 200,
              color: Colors.blue,
              child: Text('제스쳐 감지 박스'),
            ),
          )
        ],
      )

    );
  }
}
