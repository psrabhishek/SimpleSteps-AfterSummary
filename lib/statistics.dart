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



int _age = 25, _height = 170, _weight = 55, _bmi= (_weight * 10000) ~/ (_height * _height);
String _name = "User Name", _prof = "None", _surgery="None", _gender="Male";
DateTime _dob = new DateTime(2019,3,1);


class Profile extends StatelessWidget{

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;
  String _membership = "Normal", _since = "21 Feb 2019";
  

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
                    // _scaffoldKey.currentState.showSnackBar(const SnackBar(
                    //   content: Text("Coming Soon...")
                    // ));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditScreen()),);
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Text(_name),
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

//int _age, _height, _weight, _bmi= (_weight * 10000) ~/ (_height * _height)
//String _name

class EditScreen extends StatefulWidget {
 EditScreen({
    Key key,
  }) : super(key: key);

EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  String _dialogue = "not set", _text = "not set";
  final namec = TextEditingController(), heightc = TextEditingController(), weightc = TextEditingController(), genderc = TextEditingController(),
        surgeryc = TextEditingController(), profc = TextEditingController(), dobc = TextEditingController();

_showDialog(BuildContext context1) {
    return showDialog(
        context: context1,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(_dialogue),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: (){ Scaffold.of(context1).showSnackBar(SnackBar(
                      content: Text(_text),
                    ));
                    Navigator.pop(context);
                    }
              ),
            ],
          );
        });
  }

  DateTime selectedDate = _dob, today =DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(today.year-100),
        lastDate: today,
        );
    if (picked != null && picked != selectedDate)
        setState(() {
        selectedDate = picked;
      });
  }

  void changeProfile(BuildContext context)
  {
    _dob = selectedDate;
    _age = (DateTime.now().difference(_dob).inDays) ~/ 365;
    if(heightc.text != "")
      _height = int.parse(heightc.text);
    if(heightc.text != "")
      _weight = int.parse(weightc.text);
    if(weightc.text != "")
      _bmi= (_weight * 10000) ~/ (_height * _height);
    if(namec.text != "")
      _name = namec.text;
    if(profc.text != "")
      _prof = profc.text;
    if(surgeryc.text != "")
      _surgery=surgeryc.text;
    if(genderc.text != "")
      _gender=genderc.text;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
  appBar: new AppBar(
    title: new Text("Edit Profile"),
    actions: <Widget>[
      new IconButton(icon: const Icon(Icons.check), onPressed: () {  changeProfile(context);})
    ],
  ),
  body: new Column(
    children: <Widget>[
      new ListTile(
        leading: new Column(
          children: <Widget>[
            Icon(Icons.person),
            Text("    Name    ", style: new TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: _name,
          ),
          controller: namec,
        ),
      ),
      new ListTile(
        leading: new Column(
          children: <Widget>[
            Icon(Icons.accessibility),
            Text("   Height   ", style: new TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
        title: new TextField(
          controller: heightc,
          decoration: new InputDecoration(
            hintText: _height.toString(),
          ),
        ),
      ),
      new ListTile(
        leading: new Column(
          children: <Widget>[
            Icon(Icons.file_download),
            Text("   Weight   ", style: new TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
        title: new TextField(
          controller: weightc,
          decoration: new InputDecoration(
            hintText: _weight.toString(),
          ),
        ),
      ),
      new ListTile(
        leading: new Column(
          children: <Widget>[
            Icon(Icons.wc),
            Text("   Gender   ", style: new TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
        title:  new DropdownButton<String>(
        value: _gender,
        onChanged: (String newValue) {
          setState(() {
            _gender = newValue;
          });
        },
        items: <String>['Male', 'Femal','Other']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
          .toList(),
        ),
       ),

      new ListTile(
        leading: new Column(
          children: <Widget>[
            Icon(Icons.colorize),
            Text("   Surgery   ", style: new TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
        title: new DropdownButton<String>(
        value: _surgery,
        onChanged: (String newValue) {
          setState(() {
            _surgery = newValue;
          });
        },
        items: <String>['Major', 'Minor','None']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
          .toList(),
        ),
      ),
      //new ListTile( subtitle: new Text("Profession"),),
      new ListTile(
        leading: 
         //Icon(Icons.work),
          new Column(
          children: <Widget>[
            Icon(Icons.work),
            Text("Profession", style: new TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
        //subtitle: new Text("Profession"),
        title: new TextField(
          controller: profc,
          decoration: new InputDecoration(
            hintText: _prof,
          ),
        ),
        
      ),
      
      new ListTile(
        leading: new Column(
          children: <Widget>[
            Icon(Icons.date_range),
            Text("      DOB      ", style: new TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
        title:  new GestureDetector(
          onTap: () =>_selectDate(context),
          child: Text(selectedDate.toString().split(" ")[0]),
        ), 
      ),
    ],
  ),
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