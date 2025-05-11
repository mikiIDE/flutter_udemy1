import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// プッシュ遷移の関数
class _MyHomePageState extends State<MyHomePage> {
  void _pushPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NextPage(id: 1, name: "プッシュ呼び出し");
        },
      ),
    );
  }

  // モーダル遷移の関数
  void _modalPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NextPage(id: 2, name: "モーダル呼び出し");
        },
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _pushPage();
              },
              child: Text("プッシュ遷移"),
            ),
            ElevatedButton(
              onPressed: () {
                _modalPage();
              },
              child: Text("モーダル遷移"),
            ),
          ],
        ),
      ),
    );
  }
}

// 遷移先のページ（NextPage）ウィジェット
class NextPage extends StatelessWidget {
  // コンストラクタで受け取る引数を追加
  NextPage({required this.id, required this.name});

  final int id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NextPage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Next Pageです。id={$id} name={$name}",
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                // 押した時の動作
                Navigator.pop(context);
              },
              child: Text(id == 1 ? "戻る" : "閉じる"),
            ),
          ],
        ),
      ),
    );
  }
}
