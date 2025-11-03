

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kmarket_shopping_app/providers/auth_provider.dart';
import 'package:kmarket_shopping_app/screens/member/terms_screen.dart';
import 'package:kmarket_shopping_app/services/member_service.dart';
import 'package:kmarket_shopping_app/services/token_storage_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  final _idController = TextEditingController();
  final _pwController = TextEditingController();

  final service = MemberService();
  final tokenStorageService = TokenStorageService();

  void _proLogin() async {

    final usid = _idController.text;
    final pass = _pwController.text;

    if (usid.isEmpty || pass.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('아이디, 비밀번호를 입력하세요.'))
      );
      return;
    }

    try {
      Map<String, dynamic> jsonData = await service.login(usid, pass);

      String accessToken = jsonData['accessToken'];
      log('accessToken : $accessToken');

      if (accessToken != null){
        // 토큰 저장 (SharedPreference or SecurePreference)

        context.read<AuthProvider>().login(accessToken);

        // 로그인 화면 닫기
        Navigator.of(context).pop();
      }

    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("예외발생 : $err"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인'),),
      body: Center(
        child: Padding(
            padding: EdgeInsetsGeometry.all( 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/main/logo.png'),
              const SizedBox(height: 20,),
              const Text('쇼핑몰 로그인', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                labelText: '아이디 입력',
                border: OutlineInputBorder()
              ),),
              const SizedBox(height: 10,),
              TextField(
                obscureText: true,
                controller: _pwController,
                decoration: InputDecoration(
                  labelText: '비밀번호 입력',
                  border: OutlineInputBorder()
              ),),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: _proLogin,
                    child: const Text('로그인', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),)
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => TermsScreen())
                      );
                    },
                    child: const Text('회원가입', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),)
                ),
              )

            ],
          ),

        ),
      ),
    );
  }

}