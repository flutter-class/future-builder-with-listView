import 'package:flutter/material.dart';
import '../model/user.dart';

class UserDetailScreen extends StatefulWidget {
  User _user;
  UserDetailScreen(this._user);

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState(this._user);
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  User _user;
  String _name;
  String _email;
  String _about;
  int _index;
  String _picture;


  _UserDetailScreenState(this._user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_user.name),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://cn.opendesktop.org/img/c/e/d/4/cb09d054a7cffcc9917dbc64a347595ed27f.jpg'),fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(_user.picture),fit: BoxFit.fill)
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 12.9),
                        child: Text(_user.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),)
                    )

                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(12.0),
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(12.0,),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Name : ${_user.name}",style: TextStyle(fontSize: 16),),
                    Padding(padding: EdgeInsets.only(top: 8),
                    child: Text("email: ${_user.email}",style: TextStyle(fontSize: 16),),),
                    Padding(
                      padding: EdgeInsets.only(top: 16,bottom: 16),
                      child: Text("About",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800,color: Colors.blue),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text("${_user.about}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    )

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
