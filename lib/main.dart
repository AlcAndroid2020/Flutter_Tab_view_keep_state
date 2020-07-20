
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Bottom navigator bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  int _currentindex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (page){
          setState(() {
            _currentindex = page;
            pageController.animateToPage(page,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        children: <Widget>[
          HomeTab(),
          MenuTab(),
          ProfileTab(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text("Menu")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Profile")),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  bool isClicked = false;
  List<String> PostList = ["post1"];

  @override
  void initState() {
    print("Home");
    super.initState();
  }

  renderPost(String post, int index) {
    return Container(
      height: 100,
      color: Colors.green,
      child: Text(
        post,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
            onPressed: () {
              setState(() {
                isClicked = true;
                PostList.add("Post ${PostList.length + 1}");
              });
            },
            child: Text("add Post")),
        Flexible(
          child: ListView.builder(
            itemCount: PostList.length,
            itemBuilder: (context, i) => renderPost(PostList[i], i),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> with AutomaticKeepAliveClientMixin {
  bool isClicked = false;
  List<String> toDoList = ["todo1"];
  @override
  void initState() {
    print("Menu");
    super.initState();
  }
  renderTodos(String todos, int index) {
    return Container(
      height: 100,
      color: Colors.blue,
      child: Text(
        todos,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
            onPressed: () {
              setState(() {
                isClicked = true;
                toDoList.add("Post ${toDoList.length + 1}");
              });
            },
            child: Text("add Post")),
        Flexible(
          child: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, i) => renderTodos(toDoList[i], i),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with AutomaticKeepAliveClientMixin {
  bool isClicked = false;

  @override
  void initState() {
    print("Profile");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isClicked
            ? SizedBox(
                height: 250,
              )
            : Container(),
        Center(
            child: Container(
          child: Text("Profile"),
        )),
        RaisedButton(
            onPressed: () {
              setState(() {
                isClicked = true;
              });
            },
            child: Text("Move to middle"))
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
