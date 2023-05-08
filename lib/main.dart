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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, //Column,Rowは間隔調整等
          children: <Widget>[
            Container(
                width: double.infinity, //横幅いっぱい
                height: 10,
                color: Colors.grey[200], //赤の波戦出たときは前にカンマ忘れてないか確認
                child: ListView(
                  //Containerの中にもRow入れられる
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
                  fontSize: 10,
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
                height: 30,
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
                child: Wrap(
                  //Wrap:Rowの改行できる版　はみ出して工事カラー出て調べた
                  //Rowとの使い分けは？　Rowの方がいいとき
                  children: <Widget>[
                    ElevatedButton(
                      //2パージ目に行くボタン
                      onPressed: () {
                        Navigator.push(
                          //Navigatorクラスを使って２ページ目に行く
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage()),
                        );
                      },
                      child: Text('２ページ目に行きます！'),
                    ),

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

//3-6 リストを表示

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(body: Mylist()));
  }
} //class分け　リスト用

class Mylist extends StatelessWidget {
  final List<Map<String, dynamic>> listItems = [
    {
      'text': 'トトロ',
      'color': Colors.grey[600],
    }, //colorの後ろの[]数字は色の濃さ
    {
      'text': '中トトロ',
      'color': Colors.grey[300],
    },
    {
      'text': '小トトロ',
      'color': Colors.grey[100],
    }, //配列
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
            height: 200,
            padding: EdgeInsets.all(4),
            child: ListView(children: <Widget>[
              Container(
                height: 50,
                color: Colors.white,
                child: Text('undertale'),
              ),
              Container(
                height: 50,
                color: Color.fromARGB(231, 47, 130, 171),
                child: Text('sanz'),
              ),
              Container(
                height: 50,
                color: Colors.yellow[200],
                child: Text('papyrus'),
              ),
              Container(
                  height: 50,
                  color: Color.fromARGB(255, 194, 79, 79),
                  child: Text('undyne'))
            ])),
        Container(
            height: 150,
            padding: EdgeInsets.all(4),
            child: ListView.builder(
              //配列を使ったListView
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  color: listItems[index]['color'],
                  child: Text(listItems[index]['text']),
                );
              },
            )),
        Container(
            height: 150,
            padding: EdgeInsets.all(4),
            child: ListView.separated(
                //項目の間にスペース入れる
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    color: listItems[index]['color'],
                    child: Text(listItems[index]['text']),
                  );
                },
                separatorBuilder: (context, index) {
                  //項目の間のスペースに線入れる
                  return Divider();
                })),
        Container(
            height: 300,
            child: ListView(children: [
              //containerのlistviewの中にlisttile,card
              ListTile(
                leading: Image(
                    image: AssetImage('images/kafun.png'),
                    height: 50,
                    width: 50),
                title: Text('花粉つらい'),
                subtitle: Text('説明書きみたいな'),
                trailing: Icon(Icons.more_vert),
              ),
              Card(
                child: Container(
                    height: 60, width: double.infinity, child: Text('影つくんだって')),
              ),
              Card(
                child: ListTile(
                  leading: Image(
                      image: AssetImage('images/dou.png'),
                      height: 50,
                      width: 50),
                  title: Text('Listtileと'),
                  subtitle: Text('card組み合わせ'),
                  trailing: Icon(Icons.more_vert), //右の３点
                ),
              )
            ])),
        TextButton(
            child: Text("戻る"),
            // （1） 前の画面に戻る
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            })
      ]),
    );
  }
} //ListTileを書く場所がわからなくてエラー起きた

//leadingの後に）をつけていなくてtitle,subtitle,trailingにエラー
//
           