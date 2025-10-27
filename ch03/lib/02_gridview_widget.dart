/*
  날짜 : 2025/10/27
  이름 : 이다은
  내용 : GridView 위젯 실습하기
 */

import 'package:flutter/material.dart';

void main() {
  runApp(GridViewTest());
}

class GridViewTest extends StatelessWidget{
  const GridViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cities = ['서울', '부산', '대전', '대구', '광주'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('02.GridView 위젯 실습'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 한 줄에 표시할 아이템 개수
            crossAxisSpacing: 5, // 그리드 아이템 교차축(가로) 간격
            mainAxisSpacing: 10, // 그리드 아이템 메인축(세로) 간격
            childAspectRatio: 2/3 // 그리드 아이템 가로/세로 비율 조정
          ),
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return Card(
              child: Center(
                child: Text(cities[index])
              ),
            );
          },


        ),
      ),
    );
  }

}