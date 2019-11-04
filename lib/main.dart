import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: NotesHomepage(),
    );
  }
}

class NotesHomepage extends StatefulWidget {
  NotesHomepage({Key key}) : super(key: key);

  @override
  _NotesHomepageState createState() => _NotesHomepageState();
}

class _NotesHomepageState extends State<NotesHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: Text("Notes"),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: TextField(
                            style: TextStyle(
                            
                            ),
                            decoration: InputDecoration(
                                fillColor: Colors.white, filled: true,
                                focusedBorder: InputBorder.none
                                ),
                                
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
            SliverFillRemaining(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        color: Colors.white),
                    child: Center(child: Text("trial"))))
          ],
        ));
  }
}
