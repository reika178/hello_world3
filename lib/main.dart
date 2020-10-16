import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
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

  List<DocumentSnapshot> documentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('コレクション＋ドキュメント作成'),
              onPressed: () async {
                await Firestore.instance
                    .collection('users')
                    .document('id_a')
                    .setData({'word': 'hello_rorld'});
              },
            ),
            RaisedButton(
              child: Text('ドキュメント一覧獲得'),
              onPressed: () async {
                final snapshot = 
                await Firestore.instance.collection('users').getDocuments();
                setState(() {
                  documentList = snapshot.documents;
                });
              },
            ),
            Column(
              children: documentList.map((document) {
                return ListTile(
                  title: Text('${document['word']}'),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
