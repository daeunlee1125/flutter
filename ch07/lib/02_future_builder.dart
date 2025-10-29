/*
  날짜 : 2025/10/28
  이름 : 이다은
  내용 : FutureBuilder 비동기 처리 실습
 */

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("02.FutureBuilder 비동기 처리 실습"),),
        body: FutureScreen(),
      ),
    );
  }

}

class FutureScreen extends StatefulWidget{
  const FutureScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {

  Future<String>? futureResult;

  Future<String> fetchData(){
    return Future.delayed(const Duration(seconds: 2), (){
      return '서버에서 가져온 데이터입니다.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // FutureBuilder : 비동기 작업의 진행 상태에 따라서 자동으로 UI를 갱신해주는 위젯
          FutureBuilder(
              future: futureResult, // future 속성은 비동기 작업의 Future 결과 객체
              builder: (context, snapshot){ // snapshot은 현재 상태와 결과를 담고 있는 결과 객체
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }else if (snapshot.hasError){
                  return Text('에러 발생 : ${snapshot.error}');
                }else if (snapshot.hasData){
                  return Text('결과 : ${snapshot.data}');
                }else {
                  return Text('데이터를 불러오세요.');
                }
              }
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  futureResult = fetchData();
                });
              },
              child: const Text('데이터 불러오기')
          )
        ],
      ),
    );
  }
}