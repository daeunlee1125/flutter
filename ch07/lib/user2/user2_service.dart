

import 'dart:convert';

import 'package:ch07/user2/user2.dart';
import 'package:http/http.dart' as http;

class User2Service {
  static final String basicUrl = 'http://10.0.2.2:8080/ch08';

  void insert(User2 user2) async {
    try{
      final response = await http.post(
          Uri.parse("$basicUrl/user2"),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(user2.toJson())
      );

      if (response.statusCode == 201){
        print('insert 성공');
      }
    }catch(err) {
      throw Exception(err);
    }
  }

}