/*
  날짜 : 2025/10/28
  이름 : 이다은
  내용 : Navigation 기본 실습
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
      home: FirstScreen()
    );
  }

}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("01.Flutter 네비게이션 기본"),),
      body: Column(
        children: [
          const Text('First Screen', style: TextStyle(fontSize: 36),),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ));
              },
              child: const Text('Second Screen 이동')
          ),
        ],
      ),
    );
  }
  
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("01.Flutter 네비게이션 기본"),),
      body: Column(
        children: [
          const Text('Second Screen', style: TextStyle(fontSize: 36),),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                // 현재 화면 스택 제거, 뒤로가기
                Navigator.pop(context);
              },
              child: const Text('First Screen 이동')
          ),
          ElevatedButton(
              onPressed: (){
                // 현재 화면 스택 제거, 뒤로가기
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => ThirdScreen()
                ));
              },
              child: const Text('Third Screen 이동')
          ),
        ],
      ),
    );
  }

}


class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("01.Flutter 네비게이션 기본"),),
      body: Column(
        children: [
          const Text('Third Screen', style: TextStyle(fontSize: 36),),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                // 현재 화면 스택 제거, 뒤로가기
                Navigator.pop(context);
              },
              child: const Text('Second Screen 이동')
          ),
          
        ],
      ),
    );
  }

}