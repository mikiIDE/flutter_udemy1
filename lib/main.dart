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

class _MyHomePageState extends State<MyHomePage> {
  // 電話帳の元データ（参照元）→body部分のListView.builderで表示させる
  List<Map<String, String>> contacts = [
    {"name": "山田　一郎", "number": "070-1111-1111", "address": "東京都"},
    {"name": "鈴木　太郎", "number": "080-1234-5678", "address": "神奈川県"},
    {"name": "佐藤　珠代", "number": "090-9876-5432", "address": "大阪府"},
  ];

  // プッシュ遷移の関数
  //   void _pushPage() {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return NextPage(id: 1, name: "プッシュ呼び出し");
  //         },
  //       ),
  //     );
  //   }
  //
  //   // モーダル遷移の関数
  //   void _modalPage() {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return NextPage(id: 2, name: "モーダル呼び出し");
  //         },
  //         fullscreenDialog: true,
  //       ),
  //     );
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: contacts.length, // 下のitemBuilderがこの回数分（3）ループする
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.phone),
            // 電話アイコン
            title: Text(contacts[index]["name"]!),
            subtitle: Text(contacts[index]["number"]!),
            trailing: Icon(Icons.keyboard_arrow_right),
            // iOS風の矢印アイコン
            onTap: () {
              //   詳細ページに遷移するコード
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(contact: contacts[index]);
                  },
                ),
              );
            },
          );
        },
      ),
      // プッシュ遷移とモーダル遷移
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           _pushPage();
      //         },
      //         child: Text("プッシュ遷移"),
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           _modalPage();
      //         },
      //         child: Text("モーダル遷移"),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

// 電話帳詳細画面のウィジェット
class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.contact}) : super(key: key);

  final Map<String, String> contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${contact["name"]}')), // 上段に名前表示
      body: Center(
        child: Column(
          children: [
            Text('名前：${contact["name"]}'),
            Text('電話：${contact["number"]}'),
            Text('住所：${contact["address"]}'),
            ElevatedButton(
              onPressed: () {
                // 実際には電話がかかるようなコードを記述
              },
              child: Text("電話をかける"),
            ),
          ],
        ),
      ),
    );
  }
}

// // 遷移先のページ（NextPage）ウィジェット
// class NextPage extends StatelessWidget {
//   // コンストラクタで受け取る引数を追加
//   NextPage({required this.id, required this.name});
//
//   final int id;
//   final String name;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("NextPage")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Next Pageです。id={$id} name={$name}",
//               style: TextStyle(fontSize: 16),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // 押した時の動作
//                 Navigator.pop(context);
//               },
//               child: Text(id == 1 ? "戻る" : "閉じる"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
