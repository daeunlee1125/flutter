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
    print("createState...");
    return _ChildWidgetState();
  }

}

// ChildWidget 구현 클래스
class _ChildWidgetState extends State<ChildWidget> {
  
  // 상태 초기화
  // API 서버와 통신 이뤄지는 단계
  @override
  void initState(){
    // 위젯이 처음 트리에 삽입될 때 한 번만 호출
    super.initState();
    print("initState...");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies...");
  }

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

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    // 부모 위젯이 새 데이터와 함께 위젯을 rebuild할 때 호출
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget... old = ${oldWidget.count}, new = ${widget.count}');
  }
  

  // 자원 해제해주는 단계
  @override
  void dispose() {
    // 해당 위젯이 위젯 트리에서 제거될 때 호출
    super.dispose();
    print('dispose...');
  }
  
}