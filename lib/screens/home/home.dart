import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whereisevery1/models/status.dart';
import 'package:whereisevery1/screens/authenticate/sign_in.dart';
import 'package:whereisevery1/screens/home/calendar/currentcal.dart';
import 'package:whereisevery1/screens/home/filter/onboarding.dart';
import 'package:whereisevery1/screens/home/logoutpop.dart';
import 'package:whereisevery1/screens/home/settings.dart';
import 'package:whereisevery1/screens/home/sidedrawer.dart';
//import 'package:whereisevery1/screens/wrapper.dart';
import 'package:whereisevery1/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/services/database.dart';
import 'package:whereisevery1/screens/home/statuslist.dart';
import 'package:whereisevery1/shared/myappbar.dart';
import 'package:whereisevery1/shared/searchbyname.dart';
import 'package:whereisevery1/shared/username.dart';

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

    double _height = MediaQuery.of(context).size.height;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE, d MMM').format(now);

    /*void _showLogoutPanel(){
      //showModalBottomSheet(context: context, builder: (context){
       showCupertinoModalPopup(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.fromLTRB(0,0,200,0),
          //padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          child: LogOut(),
        );
      });
    }
*/
    return StreamProvider<List<Status>>.value(
      value: DatabaseService().statuses,
      child: Scaffold(
          backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
          child: Container(
            child: Column(
                children: <Widget>[
                Container(
                  height: _height,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: -10,
                            bottom: 500,
                            left: 0,
                            right: 0,
                            child: Container(
                                color: Colors.amberAccent[100],),
                          ),
                          Positioned(
                            child: Container(child: MyAnimation()),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 600,
                            left: 0,
                            right: 70,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/Ologowie.png'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            bottom: 580,
                            left: 0,
                            right: 200,
                            child: FlatButton(
                                onPressed: () => _showSettingsPanel(),
                              child: UserName()
                            ),
                          ),
                          Positioned(
                            top: 350,
                            bottom: -50,
                            left: 160,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/plantstatus.png'),
                                  fit: BoxFit.fitHeight
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 350,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: StatusList(),
                          ),
                          Positioned(
                            top: 130,
                            bottom: 350,
                            left: 140,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/statuslist.png'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 295,
                            bottom: 355,
                            left: 10,
                            right: 100,
                            child: SearchByName(),
                          ),
                          Positioned(
                            top: 190,
                            bottom: 380,
                            left: 10,
                            right: 230,
                            child: Container(
                             child: Text('Status',
                                style: TextStyle(fontSize: 40.0,
                                  fontFamily: 'Montserrat',
                                  color: Colors.amberAccent[400],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 250,
                            bottom: 400,
                            left: 10,
                            right: 260,
                            child: FlatButton.icon(
                              label: Text('FILTERS',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                                color: Colors.black,
                              ),),
                              highlightColor: Colors.amberAccent[100],
                              icon: Icon(Icons.bubble_chart,
                              color: Colors.black,),
                              color: Colors.amberAccent[400],
                              onPressed: () async{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:(context) => OnboardingHome(),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 150,
                            bottom: 490,
                            left: 0,
                            right: 260,
                            child: Container(
                              child: FlatButton(
                                onPressed: () async{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:(context) => MyCalendar(),
                                    ),
                                  );
                                },
                              child: Text(formattedDate,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(color: Colors.amberAccent[400],
                                    fontSize: 20.0,
                                    fontFamily: 'Montserrat',

                                  ),
                              ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            bottom: 600,
                            left: 330,
                            right: 10,
                            child: FlatButton(
                              onPressed: () async{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:(context) => sign_in(),
                                  ),
                                );
                                await _auth.signOut();
                              },
                                child: Image.asset('assets/iconlogo.png'),
                            ),
                          ),
                          Positioned(
                            top: 66,
                            bottom: 600,
                            left: 345,
                            right: 0,
                            child: Text('logout',
                              style: TextStyle(fontSize: 13.0,
                                fontFamily: 'Montserrat'
                              ),
                            ),
                          ),
                       ],
                        ),
                      ),
                          ],
                        ),
                      ),
                    ),































 /*       CustomScrollView(
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
*/
















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
      ),
    );
  }
}

