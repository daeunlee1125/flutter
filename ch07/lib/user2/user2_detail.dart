
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User2Detail extends StatelessWidget{
  const User2Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User 상세정보"),),
      body: Padding(padding: EdgeInsets.all(30),
      child: Container(
        width: double.infinity,
        child: Column(

          children: [
            Text("이름 : "),
            Text("나이 : "),
            Text("주소 : "),
          ],
        ),
      ),
    ));
  }

}