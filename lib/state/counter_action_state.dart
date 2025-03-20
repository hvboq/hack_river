import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_river/state/counter_state.dart';

final counterActionProvider = NotifierProvider<CounterActionState, void>(
  CounterActionState.new,
);

class CounterActionState extends Notifier<void> {
  @override
  void build() {}

  void increment() => ref.read(counterProvider.notifier).state++;
}
