
import 'dart:math';

import 'package:ch07/user1/user1.dart';
import 'package:ch07/user1/user1_service.dart';
import 'package:flutter/material.dart';

class User1Modify extends StatefulWidget {

  final String userid;

  const User1Modify({super.key, required this.userid});

  @override
  State<StatefulWidget> createState() => _User1ModifyState();
}

class _User1ModifyState extends State<User1Modify> {



  final _formKey = GlobalKey<FormState>();
  final _useridController = TextEditingController();
  final _nameController = TextEditingController();
  final _birthController = TextEditingController();
  final _ageController = TextEditingController();

  final service = User1Service();
  late Future<User1> myUser;

  @override
  void initState() {
    super.initState();
    myUser = service.getUser(widget.userid);
  }

  String message = '';

  Future<void> _submitForm() async {

    if(!_formKey.currentState!.validate()) return;

    User1 inputUser = User1(
      userid: _useridController.text,
      name: _nameController.text,
      birth: _birthController.text,
      age: int.tryParse(_ageController.text) ?? 0
    );

    try{
      service.putUser(inputUser);
      await _showDialog('수정성공', '사용자가 성공적으로 수정되었습니다.');
      // 목록 이동
      Navigator.pop(context, true);
    } catch(err){
      message = '수정실패, 에러 발생했습니다. $err';
    }
  }
  
  Future<void> _showDialog(String title, String message){
    return showDialog(context: context, 
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), 
                child: const Text('OK')
            )
          ],
        )
    );
  }

  Future<void> selectBirth() async {
    DateTime now = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1900), 
        lastDate: now
    );

    if (selectedDate != null){
      setState(() {
        // String fmtDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        _birthController.text = selectedDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User1 수정'),),
      body: FutureBuilder(future: myUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('에러 발생 : ${snapshot.error}');
            }

            final user = snapshot.data!;

            if (_useridController.text == null || _useridController.text.isEmpty){
              _useridController.text = user.userid;
              _nameController.text = user.name;
              _ageController.text = user.age.toString();
              _birthController.text = user.birth;
            }

            return Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _useridController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '아이디 입력'
                        ),
                        readOnly:true,

                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '이름 입력'
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: _birthController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '생년월일 입력'
                        ),
                        readOnly: true,
                        onTap: selectBirth,
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: _ageController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '나이 입력'
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: const Text('취소')
                          ),
                          const SizedBox(width: 10,),
                          ElevatedButton(
                              onPressed: _submitForm,
                              child: const Text('수정')
                          ),
                        ],
                      ),
                      Text(message),
                    ],
                  )
              ),
            );
          },
      )
    );
  }

}