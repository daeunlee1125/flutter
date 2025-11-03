

import 'package:flutter/material.dart';
import 'package:kmarket_shopping_app/screens/member/register_screen.dart';

class TermsScreen extends StatefulWidget{
  const TermsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TermsScreenState();

}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('약관'),),
      body: Center(
        child: Padding(
            padding: EdgeInsetsGeometry.all( 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                    value: true,
                    onChanged: null,
                  tristate: true,
                  activeColor: Colors.blueAccent,
                ),
                title: const Text('전체 약관에 동의합니다.'),
              ),
              const Divider(),
              _buildTermsItem(title: "사이트 이용약관", value: true, isRequired: true),
              _buildTermsItem(title: "개인정보취급방침", value: true, isRequired: true),
              _buildTermsItem(title: "마케팅 수신 동의", value: true, isRequired: false),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => RegisterScreen())
                      );
                    }, 
                    child: const Text('동의하고 계속')
                ),
              )


              
            ],
          ),

        ),
      ),
    );
  }

  Widget _buildTermsItem({required String title, required bool isRequired, required bool value}){
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Checkbox(
              value: false,
              onChanged: null,
            activeColor: Colors.blueAccent,
          ),
          Expanded(
              child: Text("$title (${isRequired ? "필수" : "선택"})")
          ),
          IconButton(
              onPressed: null,
              icon: Icon(Icons.arrow_forward)
          )
        ],
      ),
    );
  }

}