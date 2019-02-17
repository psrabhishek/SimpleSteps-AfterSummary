import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Questions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Text('Questionnaire',textDirection: TextDirection.ltr,)
    );
  }

}


class Workout extends StatelessWidget{
  Widget build(BuildContext context) {
    return new Center(
      child: Text('Freestyle Workout',textDirection: TextDirection.ltr,)
    );
  }
}




class Profile extends StatelessWidget{

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;
  String _membership = "Normal", _since = "21 Feb 2019";
  static int _age = 25, _height = 170, _weight = 55, _bmi= (_weight * 10000) ~/ (_height * _height);

  Row newLine(BuildContext context)
  {
    return new Row(children: <Widget>[Text('', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5))],);
  }


  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: _appBarHeight,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.create),
                  tooltip: 'Edit',
                  onPressed: () {
                    _scaffoldKey.currentState.showSnackBar(const SnackBar(
                      content: Text("Coming Soon...")
                    ));
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('User Name'),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      'https://www.limestone.edu/sites/default/files/user.png',
                      fit: BoxFit.cover,
                      height: _appBarHeight,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                          newLine(context),
                          Row(
                            children: <Widget>[
                              Text('Age                ',
                                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)
                              ),
                              Text(_age.toString() + ' years',
                                style: TextStyle(fontSize: 25.0)
                              ),
                            ],
                          ),
                          newLine(context),
                          Row(
                            children: <Widget>[
                              Text('Height           ',
                                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)
                              ),
                              Text(_height.toString() + ' cm',
                                style: TextStyle(fontSize: 25.0)
                              ),
                            ],
                          ),
                          newLine(context),
                          Row(
                            children: <Widget>[
                              Text('Weight           ',
                                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)
                              ),
                              Text(_weight.toString() + ' Kg',
                                style: TextStyle(fontSize: 25.0)
                              ),
                            ],
                          ),
                          newLine(context),
                          Row(
                            children: <Widget>[
                              Text('BMI                ',
                                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)
                              ),
                              Text(_bmi.toString() + ' Kg/sq.m',
                                style: TextStyle(fontSize: 25.0)
                              ),
                            ],
                          ),
                          newLine(context),
                          Row(
                            children: <Widget>[
                              Text('Type               ',
                                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)
                              ),
                              Text(_membership,
                                style: TextStyle(fontSize: 25.0)
                              ),
                            ],
                          ),
                          newLine(context),
                          Row(
                            children: <Widget>[
                              Text('User since     ',
                                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)
                              ),
                              Text(_since,
                                style: TextStyle(fontSize: 25.0)
                              ),
                            ],
                          ),
                ]
              )
            )
          ] 
        )
      )
    );        
  }
}
class Premium extends StatelessWidget{
  Widget build(BuildContext context) {
    return new Center(
      child: Text('Premium Membership',textDirection: TextDirection.ltr,)
    );
  }
}


/*
enum menuItems {about, contact, sign } 
class Menu extends StatelessWidget{
  Widget build(BuildContext context) {

    return new Container(
          alignment: Alignment.bottomRight,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .58,
              right: 0,
              ),
          child: new Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width * .50,
            child: new Card(
              color: Colors.white70,
              elevation: 4.0,
            ),
          ),
        );

    return new Center(
      child: Text('Menu',textDirection: TextDirection.ltr,)
    );
  }
}*/