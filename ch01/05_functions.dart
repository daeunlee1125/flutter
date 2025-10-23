/*
  날짜 : 2025/10/23
  이름 : 이다은
  내용 : Dart 함수
 */

void hello(){
  print('Hello Dart!');
}

int add(int a, int b){
  return a + b;
}
int subtract(int a, int b){
  return a - b;
}

var greet = (String name){
  return 'Greeting $name!';
};

int plus(int a, int b) => a + b;
int minus(a, b) => a - b;




int calc(int x, int y, int Function(int, int) operation){
  return operation(x, y);
}

Function createHello(String name){
  return () => "Hello, $name";
}

void person1({String hello = 'hello', String? name}){
  print("person1 $hello, $name");
}

void person2(String name, {String? hello}){
  print("person2 $hello, $name");
}

void person3(String name, {String? hello, required int age}){
  print("person3 $hello, $name? age: $age");
}

// 선택적 위치 매개변수 함수
void user1(String name, [int age = 0]){
  print('user1 $name, $age');
}

void user2(String name, [int? age, String? address]){
  print('user2 $name, $age, $address');
}

void user3(String name, [int age = 0, String address='Unknown', String? job]){
  print('user3 $name, $age, $address, $job');
}

void main() {
  // 기본 함수
  hello();

  // 매개변수와 반환값이 있는 함수
  print(add(3, 5));

  // 익명 함수, 변수에 담겨 사용됨
  print(greet("다은"));


  // 화살표 함수 (람다식)
  print('plus(3, 2) : ${plus(3, 2)}');
  print('minus(3, 2) : ${minus(3, 2)}');


  // 고차 함수 (함수를 매개변수로 전달받거나, 반환하는 함수)

  print("빼기 함수 전달 => ${calc(3, 1, subtract)}");
  print("더하기 함수 전달 => ${calc(3, 1, add)}");

  print(createHello("이다은")());


  // 이름이 있는 매개변수 (Named Parameter, {중괄호} 매개변수)
  person1();
  person1(name: "다은");
  print("");

  person2("이다은");
  person2( hello: "안녕하세요", "이다은");
  print("");

  person3(age: 22, "이다은");
  person3(hello: "안녕하십니까", age: 22, "이다은");


  // 선택적 위치 매개변수 (Optional Positional Parameter, [대괄호] 매개변수)
  user1("이다은");
  user1("이다은2", 22); // 위치바꿈 안 됨
  print("");

  user2("강감찬", 23);
  user2("이순신", 34, "부산");
  
  user3("정약용");
  user3("이다은", 34, "부산", "학생");


}