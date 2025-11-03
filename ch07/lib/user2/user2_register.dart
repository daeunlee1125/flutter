
import 'package:ch07/user2/user2.dart';
import 'package:ch07/user2/user2_service.dart';
import 'package:flutter/material.dart';


class User2Register extends StatefulWidget {
  const User2Register({super.key});

  @override
  State<StatefulWidget> createState() => _User2RegisterState();

}

class _User2RegisterState extends State<User2Register> {

  final _useridController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    User2Service service;


    return Scaffold(
      appBar: AppBar(title: const Text("user2 등록"),),
      body:Padding(padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: null,
              decoration: InputDecoration(
                  labelText: "아이디 입력"
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: null,
              decoration: InputDecoration(
                  labelText: "이름 입력"
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: null,
              decoration: InputDecoration(
                  labelText: "나이 입력"
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: null,
              decoration: InputDecoration(
                  labelText: "주소 입력"
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  /*
                  User2 us2 = User2(
                      userid: userid,
                      address: address,
                      age: age,
                      name: name
                  );
                  service.insert(us2);
                   */
                },
                child: const Text("등록하기")
            )
          ],
        ),
      )
    );
  }

}