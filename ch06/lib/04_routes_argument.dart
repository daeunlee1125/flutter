/*
  날짜 : 2025/10/28
  이름 : 이다은
  내용 : Routes Argument 실습
 */

import 'package:flutter/material.dart';

class User {
  String userid;
  String name;
  int age;

  User({required this.userid, required this.name, required this.age});

  @override
  String toString() {
    return 'User{userid: $userid, name: $name, age: $age}';
  }


}

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 앱이 처음 시작할 때 보여지는 화면 경로
      initialRoute: '/first',

      // 전체 화면 경로 설정 및 위젯 맵핑
      routes: {
        '/first': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }

}

class FirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FirstScreenState();

}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _useridController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String savedUser = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("04.Routes Argument 실습"),),
      body: Column(
        children: [
          const Text('First Screen', style: TextStyle(fontSize: 36),),
          TextField(
            controller: _useridController,
            decoration: InputDecoration(
              labelText: '아이디'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
                labelText: '이름'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: '나이'
            ),
          ),
          const SizedBox(height: 10,),

          Text('savedUser : $savedUser'),

          ElevatedButton(
              onPressed: () async {
                String userid = _useridController.text;
                String name = _nameController.text;
                int age = int.tryParse(_ageController.text) ?? 0;

                final user = User(
                    userid: userid,
                    name: name,
                    age: age
                );


                final returnedUser = await Navigator.pushNamed(context, '/second', arguments: {'user': user});
                setState(() {
                  savedUser = returnedUser.toString();
                });
                },
              child: const Text('Second Screen 이동')
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('third Screen 이동')
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

    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final User receivedUser = arguments['user'] as User;

    return Scaffold(
      appBar: AppBar(title: const Text("04.Routes Argument 실습"),),
      body: Column(
        children: [
          const Text('Second Screen', style: TextStyle(fontSize: 36),),
          const SizedBox(height: 10,),
          Text('아이디 : ${receivedUser.userid}'),
          const SizedBox(height: 10,),
          Text('이름 : ${receivedUser.name}'),
          const SizedBox(height: 10,),
          Text('나이 : ${receivedUser.age}'),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context, receivedUser);
              },
              child: const Text('First Screen 이동')
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
      appBar: AppBar(title: const Text("04.Routes Argument 실습"),),
      body: Column(
        children: [
          const Text('Third Screen', style: TextStyle(fontSize: 36),),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/first');
              },
              child: const Text('first Screen 이동')
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Second Screen 이동')
          ),

          
        ],
      ),
    );
  }

}