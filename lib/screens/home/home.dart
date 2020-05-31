import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/screens/home/settings.dart';
//import 'package:whereisevery1/screens/wrapper.dart';
import 'package:whereisevery1/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/services/database.dart';
import 'package:whereisevery1/screens/home/statuslist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 600),
          (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context) => HomePage(),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
         child: Column(
             children: <Widget>[
           Center(
             child: TweenAnimationBuilder(
                    duration: Duration(milliseconds: 200),
                   tween: Tween<double>(begin: 0,end: 1),
                  builder: (_, double size, __) {
                   return Transform.scale(scale: size,
                    child: Container(
                      height: 683,
                       decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage('assets/cats.png'),
                   ),
                  ),
                ),
               );
              },
             ),
           ),
         ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Status>>.value(
      value: DatabaseService().statuses,
      child: Scaffold(
          backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              flexibleSpace:  FlexibleSpaceBar(
                title: Text('StatusNeo',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18.0,
                    fontFamily: 'Montserrat'
                  ),
                ),
                background: Image.asset('assets/sliverdesk.png',
                fit: BoxFit.contain,),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person,
                  color: Colors.teal,
                  ),
                  label: Text('logout',
                    style:TextStyle(
                        color: Colors.teal,
                        fontSize: 15.0,
                        fontFamily: 'Montserrat'
                    ),
                  ),
                  onPressed: () async{
                    await _auth.signOut();
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.settings,
                  color: Colors.teal,),
                  label: Text('Settings',
                    style:TextStyle(
                        color: Colors.teal,
                        fontSize: 15.0,
                        fontFamily: 'Montserrat'
                    ),
                  ),
                  onPressed: () => _showSettingsPanel(),
                ),
              ],
            ),
            SliverFillRemaining(
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/sliverunsplash.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: StatusList()
              ),
            ),
          ],
        ),

















        /*appBar: AppBar(
          title: Text('Where is EveryOne'),
          backgroundColor: Colors.amberAccent[100],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
                onPressed: () async{
                  await _auth.signOut();
                },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: StatusList()
        ),*/
      ),
    );
  }
}

