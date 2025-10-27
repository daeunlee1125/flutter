/*
  날짜 : 2025/10/27
  이름 : 이다은
  내용 : State 생명주기 실습하기
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("03.상태 생명주기 실습"),
        ),
        body: ParentWidget(),
      ),
    );
  }

}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParentWidgetState();
}



class _ParentWidgetState extends State<ParentWidget> {

  // 상태 속성
  int counter = 0;
  bool showChild = true;

  void _increment(){
    setState(() {
      counter++;
    });
  }

  void _toggleChild(){
    setState(() {
      showChild = !showChild;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        ?showChild
            ? ChildWidget(count: counter,)
            : null,
        ElevatedButton(
            onPressed: _increment,
            child: const Text('ChildWidget 상태 변경')
        ),
        ElevatedButton(
            onPressed: _toggleChild,
            child: const Text('ChildWidget 생성/제거')
        )
      ],
    );
  }

}

// ChildWidget 선언 클래스
class ChildWidget extends StatefulWidget {

  ChildWidget({super.key, required this.count});

  int count;

  @override
  State<StatefulWidget> createState() {
    return _ChildWidgetState();
  }

}

// ChildWidget 구현 클래스
class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Container( 
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      child: Text('ChildWidget count : ${widget.count}',
      style: TextStyle(fontSize: 26),),
    );
  }
  
}