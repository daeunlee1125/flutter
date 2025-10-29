/*
  날짜 : 2025/10/28
  이름 : 이다은
  내용 : flutter http 통신 실습
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("04.Flutter HTTP 통신 실습"),),
        body: HttpScreen(),
      ),
    );
  }

}

class HttpScreen extends StatefulWidget{
  const HttpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {

  String result = '대기중...';
  Future<void> fetchGet(){
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');

    // http 의존성 추가 : pub.dev에서 http 검색 > yaml 파일에 http: ^1.5.0 추가
    return http.get(url, headers: {'Content-Type': 'application/json',},)
      .then((response) {
        if (response.statusCode == 200){
          Map<String, dynamic> jsonResult = jsonDecode(response.body);
          // 타입 모르겠으면 대충 var jsonResult = jsonDecode(response.body); 이케 쓰면 됨^^;;;

          setState(() {
            result = 'Get 요청 결과 : ${jsonResult}';
          });
        } else {
          setState(() {
            result = 'Get 결과 코드 : ${response.statusCode}';
          });
        }
      })
      .catchError((err){
        setState(() {
          result = '에러 발생 : $err';
        });
      })
      .whenComplete((){
        print('통신 완료...');
      });
  }

  void fetchPost() async{
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    try{
      final response = await http.post(
        url,
        headers: {'Content-Type' : 'application/json'},
        body: jsonEncode({
          "userId" : 1001,
          "title" : "Flutter Http Post 테스트",
          "completed" : false
        }),
      );

      if(response.statusCode == 201) {
        final returnedData = jsonDecode(response.body);
        setState(() {
          result = 'POST 요청 성공 : $returnedData';
        });
      }else {
        setState(() {
          result = 'Post 결과 코드 : ${response.statusCode}';
        });
      }

    }catch(err){
      result = 'POST 요청 에러 : $err';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('요청 결과 : $result'),
          Row(
            children: [
              ElevatedButton(
                  onPressed: fetchGet,
                  child: const Text('Get 요청하기')
              ),
              ElevatedButton(
                  onPressed: fetchPost,
                  child: const Text('Post 요청하기')
              ),
            ],
          ),
          const SizedBox(height: 10,),
          
        ],
      ),
    );
  }
}