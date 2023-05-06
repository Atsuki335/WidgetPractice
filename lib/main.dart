import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'widgetPractice',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'flutter-study課題'),
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
//課題３−2~3-8
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //Column,Rowは間隔調整等
          children: <Widget>[
            Container(
                width: double.infinity, //横幅いっぱい
                height: 60,
                color: Colors.grey[200], //赤の波戦出たときは前にカンマ忘れてないか確認
                child: Row(
                  //Containerの中にもRow入れられる
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        color: Color.fromARGB(255, 250, 131, 131),
                        child: Text('first')),
                    Container(color: Colors.blueAccent, child: Text('second')),
                    Container(
                        color: Color.fromARGB(255, 156, 227, 159),
                        child: Text('third')),
                  ],
                )),

            const Text('cat',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                  backgroundColor: Color.fromARGB(255, 82, 140, 255),
                )),

            const Text(
              'ん？',
              style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(200, 31, 172, 132),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            const Text('にゃあ', style: TextStyle(color: Colors.orange)),
            //colorsは決められた色の中からえらぶ、ARGBだとcolorになる
            Container(
                //四角い箱（何を入れるか）
                child: Text('(｡•ω•｡)', textAlign: TextAlign.right), //右寄せ
                width: 80, //コンテナの縦横幅
                height: 50,
                padding: EdgeInsets.all(4), //内側の余白
                margin: EdgeInsets.all(10), //外側の余白
                decoration: BoxDecoration(
                    //箱の形詳しく
                    color: Color.fromARGB(255, 248, 168, 148), //コンテナの色
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(10))),
            //角丸
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/001.png'),
                  ),
                ),
                width: 200,
                height: 100), //縦横指定したら表示された
            //decorationを入れるときは
            //containerではなくdecoration側にcolor入れる。（エラー出た）
            Container(
                width: double.maxFinite,
                height: 25,
                color: Colors.grey[200],
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text('わー'), Text('わーー')])),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //Wrap:Rowの改行できる版　はみ出して工事カラー出て調べた
                  //Rowとの使い分けは？　Rowの方がいいとき
                  children: <Widget>[
                    TextButton(
                        onPressed: null, //ボタン無効化（null)
                        child: Text('nullで押せないよ')),
                    TextButton(onPressed: () {}, child: Text('文字だけだよ')),
                    //{ボタンが実行された時の処理}
                    OutlinedButton(onPressed: () {}, child: Text('外枠付き押せた？')),

                    ElevatedButton(
                        onPressed: () {},
                        child: Text('立体的になった？押した？'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, //primaryが取り消し戦になるのはなぜ？
                            elevation: 30)),

                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.favorite),
                        label: Text('はーと')),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
