/*
  날짜 : 2025/10/23
  이름 : 이다은
  내용 : Dart 제어문
 */

import 'dart:io';

import 'bin/ch01.dart';

void main(){
  /////////////////////
  // 조건문
  /////////////////////

  int number = 10;
  if (number > 5){
    print("number은 5보다 큼");
  }
  
  if (number % 2 == 0){
    print("$number은 짝수입니다.");
  }else {
    print("$number은 홀수입니다.");
  }
  
  int score = 85;
  if (score >= 90){
    print("A 학점");
  }else if (score >= 80) {
    print("B 학점");
  }else if (score >= 70) {
    print("C 학점");
  }else {
    print("F 학점");
  }
  
  // switch
  switch (score ~/ 10) { // 정수로 출력되게 하는 나눗셈 연산자!!
    case 10:
    case 9:
      print("A 입니다.");
      break;
    case 8:
      print("B 입니다.");
      break;
    case 7:
      print("C 입니다.");
      break;
    default:
      print("F 입니다.");
      break;
  }

  /////////////////////
  // 반복문
  /////////////////////

  // 별찍기
  for (int a = 1; a <= 10; a++){
    String line = '';
    for (int b = 1; b <= a; b++){
      line += "🌟";
    }
    print(line);
  }

  int i = 5;
  while (i>0) {
    print("i : ${i--}");
  }

  for (int j=1; j<=10; j++){
    if (j%2==0){
      continue;
    }
    print("j : $j");
  }


}