import 'package:flutter/material.dart';
import 'package:myapp/statistics.dart';

void main() => runApp(new TaskyApp());

final mTitle = "Tasks";

class TaskyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: mTitle,
      home: HomePage(),
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
    );
  }
}

//Home Page
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

RelativeRect buttonMenuPosition(BuildContext c) {
    final RenderBox bar = c.findRenderObject();
    final RenderBox overlay = Overlay.of(c).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.bottomLeft(Offset.zero), ancestor: overlay),
        bar.localToGlobal(bar.size.bottomLeft(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    return position;
  }

// Home Page state
class _HomePageState extends State<HomePage> {

  /// Current bottom navigation index
  int _currentIndex = 2, _prevIndex = 2;
  Color bg = Colors.blueAccent;
  List colors = [Colors.indigoAccent, Colors.orangeAccent, Colors.lightBlueAccent, Colors.purpleAccent, Colors.pinkAccent];
  var pages = [
    new Questions(),
    new Workout(),
    new Profile(),
    new Premium(),
    //new Menu()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_prevIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.black,
        onTap: (int index) async{
          setState(() {
            _currentIndex = index;
            if(index != 4)
            {
              _prevIndex = index;
              bg = colors[index];
            }
          });
          
          if(index == 4)
          {
            final position = buttonMenuPosition(context);
            final result = await showMenu(

                    context: context,
                    position: new RelativeRect.fromLTRB(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height-267.0, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height-267.0),//position,
                    items: <PopupMenuItem<String>>[
                      const PopupMenuItem<String>(
                          child: Text('Share'), value: 'Share'),
                      const PopupMenuItem<String>(
                          child: Text('About Us'), value: 'About US'),
                      const PopupMenuItem<String>(
                          child: Text('Contact Us'), value: 'Contact Us'),
                      const PopupMenuItem<String>(
                          child: Text('Sign out'), value: 'Sign out'),
                    ],
                  );
                }                  
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: new Icon(Icons.brightness_low),
              title: new Text("Q"),
              backgroundColor: bg
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.directions_run), // optional icons are fitness center, direction bike
              title: new Text("W"),
              backgroundColor: bg
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text("S"),
              backgroundColor: bg
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.card_membership),
              title: new Text("P"),
              backgroundColor: bg
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.menu),
              title: new Text("M"),
              backgroundColor: bg
          )
        ],
        
      )
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:myapp/statistics.dart';

void main() => runApp(new TaskyApp());

final mTitle = "Tasks";

class TaskyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: mTitle,
      home: HomePage(),
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
    );
  }
}

//Home Page
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

// Home Page state
class _HomePageState extends State<HomePage> {

  /// Current bottom navigation index
  int _currentIndex = 2;
  Color bg = Colors.blueAccent;
  List colors = [Colors.indigoAccent, Colors.orangeAccent, Colors.lightBlueAccent, Colors.purpleAccent, Colors.pinkAccent];
  var pages = [
    new Questions(),
    new Workout(),
    new Statistics(),
    new Premium(),
    new Menu()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.black,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
          bg = colors[index];
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Q"),
              backgroundColor: bg
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_today),
              title: new Text("W"),
              backgroundColor: bg
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.playlist_add_check),
              title: new Text("S"),
              backgroundColor: bg
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.access_alarm),
              title: new Text("P"),
              backgroundColor: bg
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.menu),
              title: new Text("M"),
              backgroundColor: bg
          )
        ],
        
      )
    );
  }
}

*/