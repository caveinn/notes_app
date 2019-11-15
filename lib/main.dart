import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';

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
        child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: 100,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.blue, Colors.blue[900]])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "My Notes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage("https://via.placeholder.com/150"),
                  ),
                )
              ],
            )),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.blue[900]])),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: TextField(
                          style: TextStyle(),
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
          SliverFixed(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)) ,
                              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))


                  ),
                  padding: EdgeInsets.only(left:20, top:8),
                    height: 50,
                    
                    child: Text(
                      "Folder",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    )),
              )),
          SliverGroupBuilder(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) {
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.folder,
                      size: 40,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  title: Text(
                    "Notes $index",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("10 mb"),
                  trailing: Icon(Icons.more_vert),
                );
              },
              childCount: 50,
            )
                ),
          )
        ],
      ),
    );
  }
}

class SliverFixed extends SingleChildRenderObjectWidget {
  SliverFixed({Widget child, Key key}) : super(child: child, key: key);
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSliverFixed();
  }
}

class RenderSliverFixed extends RenderSliverSingleBoxAdapter {
  RenderSliverFixed({
    RenderBox child,
  }) : super(child: child);

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    child.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child.size.width;
        break;
      case Axis.vertical:
        childExtent = child.size.height;
        break;
    }
    assert(childExtent != null);
    final double paintedChildSize =
        calculatePaintOffset(constraints, from: 0.0, to: childExtent);
    final double cacheExtent =
        calculateCacheOffset(constraints, from: 0.0, to: childExtent);

    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);
    geometry = SliverGeometry(
      paintOrigin: constraints.scrollOffset,
      scrollExtent: childExtent,
      paintExtent: 40,
      cacheExtent: cacheExtent,
      maxPaintExtent: 50,
      hitTestExtent: paintedChildSize,
      // hasVisualOverflow: childExtent > constraints.remainingPaintExtent || constraints.scrollOffset > 0.0,
    );
    setChildParentData(child, constraints, geometry);
  }
}
