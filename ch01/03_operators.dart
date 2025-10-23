/*
  날짜 : 2025/10/23
  이름 : 이다은
  내용 : Dart 연산자
 */

void main(){

  //////////////////////
  // Null 관련 연산자
  //////////////////////

  // Null 병합 연산자
  int? value1;
  int result1 = value1 ?? 100; // value1이 null이면, 100을 대입!
  print('''value1 = null일 때,
[value1 ?? 100] = $result1 \n''');

  value1 = 50;
  int result2 = value1 ?? 200;
  print('''value1 = 50일 때,
[value1 ?? 200] = $result2 \n''');

  int? num1;
  int? num2;
  int? num3;

  int result3 = num1 ?? num2 ?? num3 ?? 1000;
  print('result3 : $result3');

  num2 = 2;
  int result4 = num1 ?? num2 ?? num3 ?? 1000;
  print('result4 : $result4');


  // Null 대입 연산자
  num3 ??= 3; // num3이 null이면, 3으로 초기화
  print('num3 : $num3');
  

  // Null 접근 연산자
  String? nullableString;
  print('nullableString?.toUpperCase() : ${nullableString?.toUpperCase()}');
  nullableString = 'hello Dart';
  print('nullableString?.toUpperCase() : ${nullableString?.toUpperCase()}');

  // Null 강제 연산자
  int? maybeNumber = 3;
  // Nullable 변수를 Non-Nullable 변수에 직접 대입은 안 됨.
  // 그래서 null이 아님을 보장하기 위해 ! 사용
  int mustNotNullNumber = maybeNumber!;

  print(mustNotNullNumber);







  //////////////////////
  // 기본 연산자
  //////////////////////
  int a = 10;
  int b = 3;

  // 산술 연산자
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a ~/ b);
  print(a % b);


  // 대입 연산자
  int x = 5;
  x += 3;
  print(x);

  x *= 2;
  print(x);

  // 증감 연산자
  x++;
  print(x);

  --x;
  print(x);

  // 비교 연산자
  print(a == b);
  print(a != b);
  print(a > b);
  print(a < b);
  print(a >= b);
  print(a <= b);

  // 논리 연산자
  print(a > 1 && b > 1);
  print(a < 10 || b < 11);
  print(!(a > b));

  // 삼항 연산자
  String result = a > b ? 'a가 크다.' : 'b가 크다.';
  print(result);

  // 타입 검사 연산자
  dynamic value = 'hello';
  print('value is int : ${value is int}');
  print('value is String : ${value is String}');
  print('value is! String : ${value is! String}');



}