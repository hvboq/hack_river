import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO:Family의 내부 동작은 ?
//TODO: 파라미터를 받아서 어떻게 provider를 생성하고 연결하는지?
final counterFamilyProvider =
    NotifierProvider.autoDispose.family<CounterFamilyNotifier, int, int>(
  CounterFamilyNotifier.new,
);

class CounterFamilyNotifier extends AutoDisposeFamilyNotifier<int, int> {
  @override
  int build(int arg) => 0;

  void increment() => state++;
}
