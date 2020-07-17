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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  int _counter = 0,_currentindex=0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
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
      body:  PageView(
        controller: pageController,

        children: <Widget>[
         HomeTab(),
          MenuTab(),
      ProfileTab(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.menu),title:Text("Menu")),
          BottomNavigationBarItem(icon: Icon(Icons.person),title:Text("Profile")),


        ],
        onTap: (index){
          setState(() {
            _currentindex=index;
            pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);

          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
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
  bool isClicked=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isClicked?  SizedBox(height: 250,):Container(),
        Center(child: Container(child: Text("Home"),)),
        RaisedButton(onPressed:(){
          setState(() {
            isClicked=true;
          });
        } ,child: Text("Move to middle"))
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

class _MenuTabState extends State<MenuTab> with AutomaticKeepAliveClientMixin{
  bool isClicked=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isClicked?  SizedBox(height: 250,):Container(),
        Center(child: Container(child: Text("Menu"),)),
        RaisedButton(onPressed:(){
          setState(() {
            isClicked=true;
          });
        }
        ,child: Text("Move to middle"),)      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>true;
}
class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with AutomaticKeepAliveClientMixin {
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      isClicked?  SizedBox(height: 250,):Container(),
        Center(child: Container(child: Text("Profile"),)),
      RaisedButton(onPressed:(){
        setState(() {
          isClicked=true;
        });
      } ,child: Text("Move to middle"))
      ],
    );  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
