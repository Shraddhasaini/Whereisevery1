import 'package:WhereIsEveryone/login.dart';
import 'package:WhereIsEveryone/models/users.dart';
import 'package:WhereIsEveryone/screens/storage/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:WhereIsEveryone/models/status.dart';
import 'package:WhereIsEveryone/screens/authenticate/sign_in.dart';
import 'package:WhereIsEveryone/screens/home/calendar/currentcal.dart';
import 'package:WhereIsEveryone/screens/home/filter/onboarding.dart';
import 'package:WhereIsEveryone/screens/home/logoutpop.dart';
import 'package:WhereIsEveryone/screens/home/settings.dart';
import 'package:WhereIsEveryone/screens/home/sidedrawer.dart';
//import 'package:WhereIsEveryone/screens/wrapper.dart';
import 'package:WhereIsEveryone/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:WhereIsEveryone/services/database.dart';
import 'package:WhereIsEveryone/screens/home/statuslist.dart';
import 'package:WhereIsEveryone/shared/myappbar.dart';
import 'package:WhereIsEveryone/shared/searchbyname.dart';
import 'package:WhereIsEveryone/shared/username.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: _height,
         width: _width,
         child: Column(
             children: <Widget>[
           Center(
             child: TweenAnimationBuilder(
                    duration: Duration(milliseconds: 200),
                   tween: Tween<double>(begin: 0,end: 1),
                  builder: (_, double size, __) {
                   return Transform.scale(scale: size,
                    child: Container(
                      height: _height,
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
          height: 600,
          color: Colors.black,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
            child: SettingsForm(),
          ),
        );
      });
    }

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
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
                        width: _width,
                        height: _height,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              bottom: 0.8 * (_height),
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.amberAccent[100],),
                            ),
                            Positioned(
                              child: Container(
                                  child: MyAnimation()
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: _height * 0.9,
                              left: 0,
                              right: _width * 0.2,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/Ologowie.png'),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: _height * 0.07,
                              bottom: _height * 0.9,
                              left: 0,
                              right: _width * 0.2,
                              child: FlatButton.icon(
                                  icon: Icon(Icons.perm_identity,
                                    color: Colors.amberAccent[700],),
                                  onPressed: () => _showSettingsPanel(),
                                  label: UserName()
                              ),
                            ),
                            Positioned(
                              top: _height * 0.5,
                              bottom: -_height * 0.06,
                              left: _width * 0.5,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/plantstatus.png'),
                                      fit: BoxFit.fitHeight
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: _height * 0.4,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: StatusList(),
                            ),
                            Positioned(
                              top: -_height * 0.05,
                              bottom: _height * 0.35,
                              left: _width * 0.6,
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
                              top: _height * 0.347,
                              bottom: _height * 0.61,
                              left: 10,
                              right: _width * 0.14,
                              child: SearchByName(),
                            ),
                            Positioned(
                             top: _height * 0.16,
                              bottom: _height * 0.765,
                              left: 10,
                              right: _width * 0.42,
                              child: Container(
                                //color: Colors.pink,
                                child: Text('Status',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: _width * 0.12,
                                    fontFamily: 'Sacramento',
                                    color: Colors.amberAccent[400],
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: _height * 0.3,
                              bottom: _height * 0.66,
                              left: 10,
                              right: _width * 0.42,
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
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OnboardingHome(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              top: _height * 0.24,
                              bottom: _height * 0.71,
                              left: 10,
                              right: _width * 0.42,
                              child: Container(
                                //color: Colors.blue,
                                child: FlatButton.icon(
                                  icon: Icon(Icons.calendar_today,
                                    color: Colors.amberAccent[400],),
                                  label: Text(formattedDate,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.amberAccent[400],
                                      fontSize: 24.0,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyCalendar(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: _height * 0.01,
                              // bottom: 600,
                              //left: 330,
                              height: _height * 0.08,
                              right: _width * 0.01,
                              child: FlatButton(
                                onPressed: () async {
                                  await _auth.signOut();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => sign_in(),
                                    ),
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                    children: <Widget>[
                                      Image.asset('assets/iconlogo.png'),
                                      Icon(Icons.power_settings_new,
                                      size: _width*0.04,
                                      )
                                ]
                                ),
                              ),
                            ),
                            /* Positioned(
                            top: _height*0.25,
                            bottom: _height*0.7,
                            left: 10,
                            right:  _width*0.42,
                            child: Container(
                              child: FlatButton.icon(
                                color: Colors.white10,
                                */ /*onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:(context) => Video(),
                                    ),
                                  );
                                },*/ /*
                                icon: Icon(Icons.camera_alt,
                                color: Colors.amberAccent[400],
                                ),
                                label: Text('Highlights',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: _width*0.05,
                                  fontFamily: 'Montserrat',
                                  color: Colors.amberAccent[400],
                                ),
                              ),
                              ),
                            ),
                          ),*/
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
        else{
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                    'Signing-in for the first time?',
                    style: TextStyle(
                      fontSize: _width*0.09,
                      fontFamily: 'Sacramento',
                      color: Colors.amberAccent[700],
                      //fontStyle: FontStyle.italic,
                    ),
                  ),
              ),
              Divider(height: _height*0.05),
              Container(
                child: Image.asset('assets/registerboy.png'),
              ),
              Divider(height: _height*0.05),
              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.black)
                 ),
                icon: Image.asset('assets/Google-Button.png',
                  fit: BoxFit.cover,
                  scale: 6.0,
                ),
                label: Text(
                  'Sign-up with Google',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: _width*0.04
                  ),
                ),
                color: Colors.white,
                onPressed: () async {
                  await _auth.googleSignIn();
                 // await _auth.signOut();
                },
              ),
          ]
          ),
          ),
        );
        }
        }

    );
  }
}

