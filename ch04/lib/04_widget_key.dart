/*
  날짜 : 2025/10/27
  이름 : 이다은
  내용 : 위젯 키 실습하기
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("04.위젯키 실습"),),
        body: WidgetKeyTest(),
      ),
    );
  }
}

class WidgetKeyTest extends StatefulWidget {
  const WidgetKeyTest({super.key});

  @override
  State<StatefulWidget> createState() => _WidgetKeyTestState();

}

class _WidgetKeyTestState extends State<WidgetKeyTest> {

  bool _swap = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: (){
              setState(() {
                _swap = !_swap;
              });
            },
            child: const Text("순서 바꾸기")
        ),
        Row(
          children: _swap
          ? [
            // ValueKey는 위젯을 구분하기 위한 식별값, 위젯 트리를 업데이트할 때 위젯의 상태를 보존
            // 여기서 키값이 같으면 같은 위젯으로 인식하겟죠?
            CounterBox(key: ValueKey(101), color: Colors.red),
            CounterBox(key: ValueKey(201), color: Colors.blue),
          ]
          : [
            CounterBox(key: ValueKey(201),color: Colors.blue),
            CounterBox(key: ValueKey(101),color: Colors.red),
          ],
        )
      ],
    );
  }
  
}

class CounterBox extends StatefulWidget {

  final Color color;

  const CounterBox({super.key, required this.color, });

  @override
  State<StatefulWidget> createState() => _CounterBoxState();

}

class _CounterBoxState extends State<CounterBox> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _count++;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        color: widget.color,
        child: Center(
          child: Text('count : $_count', style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }

}