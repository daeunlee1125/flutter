/*
  날짜 : 2025/10/23
  이름 : 이다은
  내용 : Dart 제네릭 컬렉션
*/

class Box<T> {
  T item;

  Box(this.item);

  T getItem(){
    return item;
  }
}

void main(){
  // 제네릭 객체 생성
  Box stringBox = Box<String>('hello');
  String text = stringBox.getItem();
  print('text : $text');

  Box intBox = Box<int>(13);
  int numb = intBox.getItem();
  print('numb : $numb');


  /////////////////////////////////
  // List
  /////////////////////////////////

  // 생성
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  print('fruits : $fruits');

  // 원소 추가
  fruits.add('Durian');
  print('fruits : $fruits');

  // 원소 참조
  print('첫번째 과일 : ${fruits[0]}');
  print('첫번째 과일 : ${fruits.first}');
  print('마지막 과일 : ${fruits.last}');
  
  // 원소 수정
  fruits[1] = 'Berry';
  print('fruits : $fruits');
  
  // 원소 제거
  String removedFruit = fruits.removeAt(0);
  print('removed : $removedFruit');
  print('fruits : $fruits');
  
  // 리스트 크기
  print('과일 개수 : ${fruits.length}');

  // 리스트 반복문
  for(var fr in fruits){
    print('과일 : $fr');
  }

  // 리스트 필터링
  List<int> numbers = [5,3,2,4,1];
  var evenNumbers = numbers.where((n) => n%2==0);
  print('짝수 : $evenNumbers');
  
  // 변환
  // List<int> doubledList = numbers.map((n) => n*2).toList();
  var doubledList = numbers.map((n) => n*2).toList();
  print('변환된 리스트 : $doubledList');

  numbers.sort();
  print('오름차순 정렬 : $numbers');

  numbers.sort((a, b) => b.compareTo(a));
  print('내림차순 정렬 : $numbers');

  // 반복처리
  numbers.forEach((n) => print('n값 : $n'));

  
  /////////////////////////////////
  // Set, 중복 제거 자료구조
  /////////////////////////////////

  Set<String> colors = {'red', 'green', 'blue'};
  print('colors : $colors');

  // 원소 추가
  colors.add('orange');
  colors.add('red'); // 중복 안 됨
  print('colors : $colors');

  // 집합 연산(합집합)
  var set1 = {1,2,3,4};
  var set2 = {3,4,5,6};

  Set<int> unionSet = set1.union(set2);
  print('합집합 : $unionSet');

  // 교집합
  Set interSet = set1.intersection(set2);
  print('교집합 : $interSet');

  // 차집합
  Set<int> diffSet = set1.difference(set2);
  print('set1(set2) 차집합 : $diffSet');


  /////////////////////////////////
  // Map
  /////////////////////////////////

  // Map 생성
  Map<String, String> user = {
    'id': 'a101',
    'name' : '홍길동',
    'address' : '부산'
  };

  print('user : $user');
  
  // 맵 키 참조
  print('이름 : ${user['name']}');
  print('주소 : ${user['address']}');
  
  // 키 존재 여부
  print('age 키 존재 여부 : ${user.containsKey('age')}');

  // 모든 키를 리스트 생성
  print('모든 키 목록 : ${user.keys.toList()}');
  print('모든 값 목록 : ${user.values.toList()}');


}