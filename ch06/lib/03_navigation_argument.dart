/*
  날짜 : 2025/10/28
  이름 : 이다은
  내용 : Navigation 데이터 전달 실습
 */

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }

}

class FirstScreen extends StatefulWidget{
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("03.네비게이션 데이터 전달 실습"),),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '이름 입력'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '나이 입력'
            ),
          ),
          const Text('First Screen', style: TextStyle(fontSize: 36),),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                String name = _nameController.text;
                int age = int.tryParse(_ageController.text) ?? 0;
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SecondScreen(name: name, age: age,)
                ));
                // Navigator.pushNamed(context, '/second');
              },
              child: const Text('Second Screen 이동')
          ),

        ],
      ),
    );
  }
  
}

class SecondScreen extends StatelessWidget {
  
  // firstScreen으로부터 전달받을 상태 속성
  final String name;
  final int age;

  const SecondScreen({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("03.네비게이션 데이터 전달 실습"),),
      body: Column(
        children: [
          const Text('Second Screen', style: TextStyle(fontSize: 36),),
          const SizedBox(height: 10,),
          Text('이름 : $name, 나이 : $age'),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('First Screen 이동')
          ),
        ],
      ),
    );
  }

}
