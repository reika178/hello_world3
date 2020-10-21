import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyFirestorePage(),
    );
  }
}

class MyFirestorePage extends StatefulWidget {
  @override
  _MyFirestorePageState createState() => _MyFirestorePageState();
}

class _MyFirestorePageState extends State<MyFirestorePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return Text("loading");
        return ListView(
          children: snapshot.data.documents.map<Widget>(
            (document) {
              return Text(document["word"]);
            },
          ).toList(),
        );
      },
    );
  }
  // List<DocumentSnapshot> documentList = [];

  // String orderDocumentInfo = '';

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Firestore hello_world')),
  //     body: Center(
  //       child: Column(
  //         children: <Widget>[
            // RaisedButton(
            //   child: Text('コレクション＋ドキュメント作成'),
            //   onPressed: () async {
            //     await Firestore.instance
            //         .collection('users')
            //         .document('id_2')
            //         .setData({'word': 'こんにちは'});
            //   },
            // ),
            // RaisedButton(
            //   child: Text('ドキュメント一覧獲得'),
            //   onPressed: () async {
            //     final snapshot = 
            //         await Firestore.instance.collection('users').getDocuments();
            //     setState(() {
            //       documentList = snapshot.documents;
            //     });
            //   },
            // ),
            // Column(
            //   children: documentList.map((document) {
            //     return ListTile(
            //       title: Text('${document['word']}'),
            //     );
            //   }).toList(),
            // ),
            // RaisedButton(
            //   child: Text('ドキュメントを指定して取得'),
            //   onPressed: () async {
            //     final document = await Firestore.instance
            //         .collection('users')
            //         .document('id_1')
            //         .get();
            //     setState(() {
            //       orderDocumentInfo = 
            //           '${document['word']}';
            //     });
            //   },
            // ),
            // ListTile(title: Text(orderDocumentInfo)),
            // RaisedButton(
            //   child: Text('ドキュメント削除'),
            //   onPressed: () async {
            //     await Firestore.instance
            //         .collection('users')
            //         .document('id_2')
            //         .delete();
            //   }
            // )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
