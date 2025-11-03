

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kmarket_shopping_app/models/member.dart';
import 'package:kmarket_shopping_app/services/member_service.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final _usidController = TextEditingController();
  final _pass1Controller = TextEditingController();
  final _pass2Controller = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  final _service = MemberService();

  bool _isLoading = false;

  void _submitForm() async {
    if (!_formKey.currentState!.validate()){
      return;
    }
    
    final member = Member(
        usid: _usidController.text,
        pass: _pass1Controller.text,
        name: _nameController.text,
        email: _emailController.text,
      role: 'USER',
    );
    
    log("member : ${member.toJson()}");

    try {
      final savedUser = await _service.register(member);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('회원가입 완료 : $savedUser'))
      );

      if (!savedUser.isEmpty){
        Navigator.of(context).pop();
      }

    }catch(err) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('에러 발생 : $err'))
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    // 생명주기함수! 지금 화면 사라질 때 호출됨
    _usidController.dispose();
    _pass1Controller.dispose();
    _pass2Controller.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원가입'),),
      body: Center(
        child: Padding(
            padding: EdgeInsetsGeometry.all( 40),
          child: Form(
            key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('기본 정보 입력'),
                  const SizedBox(height: 20,),
                  _buildInputField(
                      title: "아이디 입력",
                      controller: _usidController,
                    validator: (value){
                        if (value == null || value.length < 4){
                          return '아이디는 4자 이상이어야 합니다.';
                        }
                        return null;
                    }
                  ),
                  const SizedBox(height: 10,),
                  _buildInputField(
                      title: "비밀번호 입력",
                      controller: _pass1Controller,
                      validator: (value){
                        if (value == null || value.length < 4){
                          return '비밀번호는 4자 이상이어야 합니다.';
                        }
                        return null;
                      }
                  ),
                  const SizedBox(height: 10,),
                  _buildInputField(
                      title: "비밀번호 확인",
                      controller: _pass2Controller,
                      validator: (value){
                        if (value == null || value.length < 4){
                          if (value != _pass1Controller.text){
                            return '비밀번호가 일치하지 않습니다.';
                          }

                          return '비밀번호는 4자 이상이어야 합니다.';
                        }
                        return null;

                      }

                  ),
                  const SizedBox(height: 10,),
                  _buildInputField(
                      title: "이름 입력",
                      controller: _nameController,
                      validator: (value){
                        if (value == null){
                          return '이름은 필수 입력 항목입니다.';
                        }
                        return null;
                      }
                  ),
                  const SizedBox(height: 10,),
                  _buildInputField(
                      title: "이메일 입력 (선택)",
                      controller: _emailController,
                      validator: (value){
                        return null;
                      }
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: const Text('취소'),
                        ),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text('가입'),
                        )
                      ],
                    ),
                  ),
                ],
              )
          )

        ),
      ),
    );
  }

  // 입력 필드 디자인 함수
  Widget _buildInputField({
    required TextEditingController controller,
    required String title,
    required String? Function(String?) validator,
    bool isPass = false
  }){
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 15)
      ),
      validator: validator,
    );
  }

}