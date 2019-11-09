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
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 1000.0),
            child:Container(
              padding:EdgeInsets.only(top:MediaQuery.of(context).padding.top),
              height: 100,
              decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.blue[900]
                        ])
                    ), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text("My Notes", 
                    style: TextStyle(color:Colors.white, fontSize: 20, fontWeight: FontWeight.bold ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage("https://via.placeholder.com/150"),),
                  )


                ],
              )
              ),),
  
          body: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.blue[900]
                        ])
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            child: TextField(
                              style: TextStyle(
                              
                              ),
                              decoration: InputDecoration(
                                  fillColor: Colors.indigo, 
                                  filled: true,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Icon(Icons.search),
                                  hintText: "Type text to search her",
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
                              BorderRadius.vertical(top: Radius.circular(30)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         Container(
                           padding: EdgeInsets.only(left: 20, top: 20),
                           child: Text("Folder", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),)
                           ),
                         Expanded(
                            child: ListView.builder(
                             itemCount: 100,
                             itemBuilder: (context, index){
                               return ListTile(
                                 leading: Padding(
                                   padding: const EdgeInsets.only(right: 20.0),
                                   child: Icon(
                                     Icons.folder,
                                     size: 40,
                                     color: Theme.of(context).primaryColor,
                                   ),
                                 ),
                                 title: Text("Notes $index", style:TextStyle(fontWeight: FontWeight.bold) ,),
                                 subtitle: Text("10 mb"),
                                 trailing: Icon(Icons.more_vert),
                                 
                                 );
                                 
                             } ,
                           ),
                         )
                        ],

                      )))
            ],
          ),
    );
  }
}
