import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_river/state/counter_action_state.dart';
import 'package:hack_river/state/counter_state.dart';

void main() {
  runApp(const MyApp());
}

//TODO: ConsumerWidget, ConsumerStatefulWidget이 정확히 무엇인지? 내부는?
//TODO: 어떤 것을 상속받는지 ?
//TODO: 어떻게 provider의 변경을 감지하고 리빌드 하는지?
class MyApp extends StatelessWidget {
  final String title = '강을 핵하자';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: CounterPage(title: title));
  }
}

class CounterPage extends ConsumerWidget {
  final String title;
  const CounterPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      //TODO: watch, read, listen 차이
      ref.read(counterActionProvider.notifier).increment();
    }

    final int count = ref.watch(counterProvider);

    //TODO:위젯 전체를 프로바이더 스코프로 감싸야 하는 이유
    //TODO:프로아비어 스코프와 프로바이더의 인헤리티드 위젯의 차이
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //TODO: Consumer 위젯의 역할
                //TODO: 어떻게 ConsumerWidget 혹은 ConsumerStatefulWidget 위젯이 없어도 provider를 사용할 수 있는지 ?
                Consumer(builder: (context, ref, child) {
                  final count = ref.watch(counterProvider);
                  return Text('consumer 횟수 : $count');
                }),
                Text(
                  'watch 횟수 : $count',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onPressed,
          tooltip: '증가',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
