import 'package:flutter/material.dart';
import 'dart:math'; //랜덤 사용하기 위한 임포트
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '날씨 이모티콘 랜덤 출력'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<String> images = ['assets/01.jpg','assets/02.jpg','assets/03.jpg'];

  void _incrementCounter() {
    setState(() {


      if (_counter < 3) { /*3개의 이미지가 있다 여기서 숫자가 계속 카운터가 되지 않고
        3이라는 숫자가 나올때 까지만 카운터를 계속하고 3이 초과가 되면 다시 숫자 1로
        리턴이 된다.*/
        _counter++;
      } else {
        _counter = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var ran = Random();
    var randomindx = ran.nextInt(images.length);

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset(images[randomindx]), // 이미지 랜덤 출력
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
