import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_river/state/counter_state.dart';

final counterActionProvider =
    NotifierProvider.autoDispose<CounterActionState, void>(
  CounterActionState.new,
);

class CounterActionState extends AutoDisposeNotifier<void> {
  @override
  void build() {}

  void increment() => ref.read(counterProvider.notifier).state++;
}
