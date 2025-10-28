/*
  날짜 : 2025/10/28
  이름 : 이다은
  내용 : ListView 위젯 실습하기
 */

import 'package:ch05/02_provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 상태관리 모델 클래스 정의
class CounterNotifier extends StateNotifier<int>{

  CounterNotifier() : super(0); // 상태 초기화

  void increment() => state++;
  void decrement() => state--;
  
}

// 상태관리 모델 클래스 프로바이더 등록
final counterProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier()
);

final checkProvider = StateProvider((ref) => false,);


void main(){
  // riverpod 의존성 설정 : pub.dev에서 flutter riverpod 의존성 검색 > 2버전 복사
  // pubspec.yaml > flutter_riverpod: ^2.6.1 추가
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("04.Riverpod 상태 관리 실습"),),
        body: ParentWidget(),
      ),
    );
  }

}

// Riverpod 프로바이더 제공을 위한 ConsumerWidget 상속
class ParentWidget extends ConsumerWidget {
  const ParentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // ref : Riverpod 상태모델 접근을 위한 참조객체

    // 상태 구독
    final counter = ref.watch(counterProvider);
    final check = ref.watch(checkProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Riverpod counter : $counter'),
        Row(
          children: [
            ElevatedButton(onPressed: (){
              ref.read(counterProvider.notifier).increment();
            }, child: const Text('증가')),
            ElevatedButton(onPressed: (){
              ref.read(counterProvider.notifier).decrement();
            }, child: const Text('감소')),
           
          ],
        ),
        const Divider(),
        Text(check ? '동의하셨습니다.' : '동의해주세요.'),
        CheckboxListTile(
          title: const Text("동의합니다."),
            value: check,
            onChanged: (value){
              ref.read(checkProvider.notifier).state = value ?? false;
            }
        )
        
      ],
    );
  }



}