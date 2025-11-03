
import 'package:flutter/material.dart';

class User1List extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _User1ListState();
}

class _User1ListState extends State<User1List> {
  Future<String>? futureResult;

  Future<String> fetchData(){
    return Future.delayed(const Duration(seconds: 2), (){
      return '서버에서 가져온 데이터입니다.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User1 목록'),),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
            future: futureResult, // future 속성은 비동기 작업의 Future 결과 객체
            builder: (context, snapshot) { // snapshot은 현재 상태와 결과를 담고 있는 결과 객체
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('에러 발생 : ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Text('결과 : ${snapshot.data}');
              }

              final userList = snapshot.data;

              return ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('avatar'),
                      ),
                      title: Text('홍길동(아이디)'),
                      subtitle: Text('1990-09-01'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.edit), color: Colors.blue,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Colors.red,),
                          ],
                      ),
                    ),
                  );
              });
          })
    );
  }

}