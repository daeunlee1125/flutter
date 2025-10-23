/*
  날짜 : 2025/10/23
  이름 : 이다은
  내용 : Dart 상속
 */

// 부모 클래스
class Animal{
  String _name;
  Animal(this._name);
  void speak(){
    print('speak $_name');
  }

  void move() {
    print('move $_name');
  }
}

class Dog extends Animal {
  String _breed;
  Dog(String name, this._breed) : super(name);

  @override
  void speak(){
    print('$_name($_breed) : 멍멍!');
  }
  
  void walk(){
    print('$_name($_breed) : 산책 중...');
  }
}

class Cat extends Animal {
  String _breed;
  Cat(String name, this._breed) : super(name);

  @override
  void speak(){
    print('$_name($_breed) : 야옹!');
  }

  void play(){
    print('$_name($_breed) : 놀이 중...');
  }
}

void main(){

  // Animal 생성
  Animal animal = Animal('동물');
  animal.speak();
  animal.move();
  print("");

  // Dog 생성
  Dog dog = Dog('뽀삐', '시베리안 허스키');
  dog.speak();
  dog.move();
  dog.walk();
  print("");
  
  // Cat 생성
  Cat cat = Cat('김체다', '치즈냥이');
  cat.speak();
  cat.move();
  cat.play();
  print("");

  // 다형성
  Animal a1 = Dog('가나디', '말티즈');
  Animal a2 = Cat('루이', '샴');

  a1.speak();
  a2.speak();

  if (a1 is Dog){
    a1.walk();
  }else if (a1 is Cat){
    a1.play();
  }

}