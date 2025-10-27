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
      home: const MyHomePage(title: '08. 기타 나머지 위젯실습'),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("일반 텍스트",
              style: TextStyle(fontSize: 26),),

            // Center : 위젯을 가운데로 정렬
            Center(
              child: Text('가로중앙 정렬 텍스트',
                style: TextStyle(fontSize: 26),),
            ),

            // Expanded
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      width: 50,
                      height: 400,
                      color: Colors.red,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      width: 50,
                      height: 100,
                      color: Colors.green,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      width: 50,
                      height: 100,
                      color: Colors.blue,
                    )),
              ],
            ),

            // Card : 그림자가 있는 둥근 사각형 박스
            Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(12),
              child: Container(
                width: 200,
                height: 100,
                child: Column(
                  children: [
                    Text('제목'),
                    Text('내용')
                  ],
                ),
              ),
            ),

            // Padding
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('padding 10')
                ],
              ),
            ),


            // Icon : 웹 아이콘 출력 위젯
            Row(
              children: [
                Icon(
                  Icons.home,
                  size:
                  60,
                ),
                Spacer(), // 위젯과 위젯 사이의 빈공간 배치에서 비율 정렬
                Icon(
                  Icons.favorite,
                  size: 60,
                  color: Colors.red,
                ),
                Icon(
                  Icons.handshake,
                  size: 60,
                  color: Colors.blue,
                )
              ],
            ),

            // Spacer : 위젯과 위젯 사이의 빈공간 배치에서 비율 정렬
            Row(
              children: [
                Icon(
                  Icons.home,
                  size:
                  60,
                ),
                Spacer(flex: 1,),
                Icon(
                  Icons.favorite,
                  size: 60,
                  color: Colors.red,
                ),
                Spacer(flex: 2,),
                Icon(
                  Icons.handshake,
                  size: 60,
                  color: Colors.blue,
                )
              ],
            ),

            // SizedBox : 위젯과 위젯 사이에 여백을 줄 때 사용하는 위젯
            SizedBox(
              width: 300,
              height: 100,
              child: Container(
                color: Colors.blue,
              ),
            ),

            // SingleChildScrollView
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 400,
                    height: 200,
                    color: Colors.red,
                    child: Text('Box1'),
                  ),
                  Container(
                    width: 400,
                    height: 200,
                    color: Colors.green,
                    child: Text('Box1'),
                  ),
                  Container(
                    width: 400,
                    height: 200,
                    color: Colors.blue,
                    child: Text('Box1'),
                  )
                ],
              ),
            )


          ],
        ),
      )

    );
  }
}
