import 'package:flutter/material.dart';
import 'package:share/share.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String sendData = "Share Data To Another App In Flutter";
  String dataFromTextField;

  _share() {
    final RenderBox renderBox = context.findRenderObject();
    Share.share(dataFromTextField,
        sharePositionOrigin:
            renderBox.localToGlobal(Offset.zero) & renderBox.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Share Data To Another App In Flutter'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            Image.asset('assets/images/sharedata.png'),
            SizedBox(height: 24.0),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[100]),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter some text and/or link to share",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
                onChanged: (text) => setState(() {
                  dataFromTextField = text;
                }),
              ),
            ),
            SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _share();
                });
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6),
                  ]),
                ),
                child: Center(
                  child: Text(
                    "Send Data To Other App",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
