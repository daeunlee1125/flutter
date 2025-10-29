/*
  날짜 : 2025/10/28
  이름 : 이다은
  내용 : MultiProvider 실습하기
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 실전에서는 각자 개별 파일로 만들어야 함!
// 1.날짜시간 프로바이더
class ClockProvider extends ChangeNotifier {
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  ClockProvider(){
    Timer.periodic(const Duration(seconds: 1), (timer){
      _dateTime = DateTime.now();
      notifyListeners(); // 1초마다 시간 바뀌었다고 알림 보내줌
    });
  }
}

// 2.카운터 프로바이더
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

}

// 3.장바구니 프로바이더
class CartProvider extends ChangeNotifier {

  List<String> _products = [];
  List<String> get products => _products;
  int get productCount => _products.length;

  void add(String product){
    _products.add(product);
    notifyListeners();
  }

  void remove(String product){
    _products.remove(product);
    notifyListeners();
  }

  void clear(){
    _products.clear();
    notifyListeners();
  }
}

void main(){
  runApp(

    // 하나 이상의 프로바이더 설정
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>ClockProvider()),
          ChangeNotifierProvider(create: (_)=>CounterProvider()),
          ChangeNotifierProvider(create: (_)=>CartProvider()),
        ],
        child: MyApp(),
      )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("03.MultiProvider 상태 관리 실습"),),
        body: ParentWidget(),
      ),
    );
  }

}

class ParentWidget extends StatelessWidget {
  const ParentWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
    );
  }

}