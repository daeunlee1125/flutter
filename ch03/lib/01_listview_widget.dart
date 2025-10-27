/*
  날짜 : 2025/10/27
  이름 : 이다은
  내용 : ListView 위젯 실습하기
 */

import 'package:flutter/material.dart';

void main(){

  // runApp(ListViewTest1());
  // runApp(ListViewTest2());
  runApp(ListViewTest3());


}

class ListViewTest1 extends StatelessWidget {

  const ListViewTest1({super.key});

  @override // 얘가 화면에 위젯 바로 출력하는 메서드!
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('01.ListView 위젯 실습'),),
        body: ListView(
          children: [

            for(int i=1; i<=5; i++)
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blueAccent[100],
                    border: Border.all(
                        width: 1,
                        color: Colors.black
                    )
                ),
                child: Text('${i}번째 항목'),
              ),

            // ListTile은 리스트 아이템 항목을 구성하는 위젯
            ListTile(
              leading: const Icon(Icons.sunny),
              title: const Text('ListTile 제목'),
              subtitle: const Text('ListTile 내용'),
              trailing: const Icon(Icons.menu),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
              ),

              title: const Text('ListTile 제목'),
              subtitle: const Text('ListTile 내용'),
              trailing: const Icon(Icons.more_vert),
              onTap: (){
                print('클릭!');
              },
            ),
          ],
        ),
      ),
    );
  }
  
}



class ListViewTest2 extends StatelessWidget {

  const ListViewTest2({super.key});

  @override // 얘가 화면에 위젯 바로 출력하는 메서드!
  Widget build(BuildContext context) {

    List<String> personList = ['김유신', '김춘추', '장보고',
      '강감찬', '이순신', '정약용', '안중근', '유관순', '안창호', '이다은'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('02.ListView.builder 위젯 실습'),),
        body: ListView.builder(
          itemCount: personList.length, // 목록에 출력할 총 아이템 개수
          itemBuilder: (context, index){ // 인덱스를 기반으로 각 아이템 위젯 생성
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blueAccent[100],
                  border: Border.all(
                      width: 1,
                      color: Colors.black
                  )
              ),
              child: Text('${personList[index]}'),
            );
          },
        ),
      ),
    );
  }
}


class ListViewTest3 extends StatelessWidget {

  const ListViewTest3({super.key});

  @override // 얘가 화면에 위젯 바로 출력하는 메서드!
  Widget build(BuildContext context) {
    List<User> userList = [
      User('a101', '김유신', '1990-07-01', 23, 'https://picsum.photos/id/237/200/300'),
      User('a102', '김춘추', '1991-07-01', 26, 'https://picsum.photos/id/231/200/300'),
      User('a103', '강감찬', '1992-07-01', 21, 'https://picsum.photos/id/213/200/300'),
      User('a104', '이순신', '1993-07-01', 27, 'https://picsum.photos/id/240/200/300'),
      User('a105', '장보고', '1994-07-01', 42, 'https://picsum.photos/id/221/200/300'),
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('03.ListView.builder 위젯 실습'),),
        body: ListView.separated(
          itemCount: userList.length, // 목록에 출력할 총 아이템 개수
          itemBuilder: (context, index) { // 인덱스를 기반으로 각 아이템 위젯 생성
            return ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(userList[index].avatar),
              ),
              title: Text("${userList[index].name}(${userList[index].userid})"),
              subtitle: Text("${userList[index].birth}, ${userList[index].age}세"),
              trailing: Icon(Icons.more_vert),
              onTap: () {
                print('유저 클릭');
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1, color: Colors.grey,);
          },
        ),
      ),
    );
  }

}

// User 모델(Spring의 DTO 역할)
class User {
  String userid;
  String name;
  String birth;
  int age;
  String avatar;

  User(this.userid, this.name, this.birth, this.age, this.avatar);
}