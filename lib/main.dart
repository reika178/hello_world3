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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
    stream: Firestore.instance.collection('users').document('id_1').snapshots(),
    builder: (context, snapshot) {
      return Text(snapshot.data["word"]);
    },
  );
}
  // List<DocumentSnapshot> documentList = [];

  // String orderDocumentInfo = '';

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         children: <Widget>[
  //           RaisedButton(
  //             child: Text('コレクション＋ドキュメント作成'),
  //             onPressed: () async {
  //               await Firestore.instance
  //                   .collection('users')
  //                   .document('id_1')
  //                   .setData({'word': 'hello_world'});
  //             },
  //           ),
  //           RaisedButton(
  //             child: Text('ドキュメント一覧獲得'),
  //             onPressed: () async {
  //               final snapshot = 
  //                   await Firestore.instance.collection('users').getDocuments();
  //               setState(() {
  //                 documentList = snapshot.documents;
  //               });
  //             },
  //           ),
  //           Column(
  //             children: documentList.map((document) {
  //               return ListTile(
  //                 title: Text('${document['word']}'),
  //               );
  //             }).toList(),
  //           ),
  //           RaisedButton(
  //             child: Text('ドキュメントを指定して取得'),
  //             onPressed: () async {
  //               final document = await Firestore.instance
  //                   .collection('users')
  //                   .document('id_1')
  //                   .get();
  //               setState(() {
  //                 orderDocumentInfo = 
  //                     '${document['word']}';
  //               });
  //             },
  //           ),
  //           ListTile(title: Text(orderDocumentInfo)),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
