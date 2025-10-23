/*
  날짜 : 2025/10/23
  이름 : 이다은
  내용 : Dart 추상클래스와 인터페이스
 */

// 추상 클래스
abstract class Animal {

  String name;

  Animal(this.name);
  
  // 추상 메서드
  void speak();

  void hello(){
    print('hello $name');
  }

}


class Dog extends Animal {
  String breed;
  Dog(String name, this.breed) : super(name);

  @override
  void speak(){
    print('$name($breed) 멍멍!');
  }
}

// 인터페이스
// Dart에서는 interface<< 키워드 말고 abstract 키워드로 정의!
abstract class Vehicle {

  void start();
  void stop();

}

class Car implements Vehicle {
  String _brand;

  Car(this._brand);

  @override
  void start() {
    print('$_brand 출발...');
  }

  @override
  void stop() {
    print('$_brand 정지...');
  }

}

// 믹스인(Mixin)
mixin Swimmable {
  void swim(){
    print('헤엄칩니다.');
  }
}

mixin Flyable {
  void fly(){
    print('날아갑니다.');
  }
}

mixin Walkable {
  void walk(){
    print('걸어갑니다.');
  }
}

// 믹스인 사용
class Duck extends Animal with Swimmable, Flyable, Walkable{

  Duck(String name) : super(name);

  @override
  void speak() {
    print('오리가 꽥꽥!');
  }

}


void main(){
  
  // 추상클래스
  // 직접적인 객체 생성은 불가능하죠?
  // 추상클래스 Animal을 상속받는 놈들로 생성 가능!
  Animal animal = Dog('뽀삐', '푸들');
  animal.speak();
  
  // 인터페이스
  Vehicle car = Car("현대차");
  car.start();
  car.stop();
  
  // 믹스인
  Duck duck = Duck('모모');
  duck.speak();
  duck.swim();
  duck.walk();
  duck.fly();

}