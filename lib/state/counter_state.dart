import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO: autoDispose 와 일반 notifierProvider의 차이
//TODO: autodispose, keepAlive
final counterProvider = NotifierProvider.autoDispose<CounterNotifier, int>(
  CounterNotifier.new,
);

class CounterNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() => 0; // 초기값

  void increment() => state++;
}
