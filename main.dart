import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    //MaterialApp: Google
    //CupertinoApp: Apple
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle
                  ? const MyLargeTitle()
                  : const Text(
                      'nothing',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                      ),
                    ),
              IconButton(
                iconSize: 60,
                color: Colors.black87,
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  @override
  void dispose() {
    super.dispose();
    print('dispose!');
  }
  //위젯이 스크린에서 제거될 때 호출되는 메소드
  //API 업데이트나 이벤트 리스너로부터 구독을 취소하거나
  //form의 리스너로부터 벗어나고 싶을 때 사용
  //즉, 무언가를 취소하는 곳

  @override
  void initState() {
    super.initState();
    print('initState!');
  }
  //상태를 초기화하기 위하 메소드
  //꼭 이 메소드를 사용하지 않아도 됨
  //상태 변수는 int count = 0;처럼 하면 됨
  //종종 API에서 업데이트를 구독하고 싶을 때 initState 사용
  //무조건 build 메소드 앞에 와야 함
  //단 한번만 실행됨

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
