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

    // 프로바이더 구축
    final clockProvider = context.watch<ClockProvider>();
    final counterProvider = Provider.of<CounterProvider>(context, listen: true);
    final cartProvider = context.watch<CartProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('현재시간'),
        Text('${clockProvider.dateTime.hour}:${clockProvider.dateTime.minute}:${clockProvider.dateTime.second}'),
        const Divider(),
        const Text('카운트'),
        Text('CounterProvider count : ${counterProvider.count}'),
        ElevatedButton(onPressed: (){
          counterProvider.increment();
        }, child: const Text('증가')),
        const Divider(),
        Text('장바구니 상품 개수 : ${cartProvider.productCount}'),
        Text('장바구니 상품 목록 : ${cartProvider.products}'),
        Row(
          children: [
            ElevatedButton(onPressed: (){
              cartProvider.add('상품-${cartProvider.productCount + 1}');
            }, child: const Text('상품 추가')),
            ElevatedButton(onPressed: (){
              cartProvider.remove('상품-${cartProvider.productCount }');
            }, child: const Text('상품 제거')),
            ElevatedButton(onPressed: (){
              cartProvider.clear();
            }, child: const Text('전체 삭제')),
          ],
        )
      ],
    );
  }

}