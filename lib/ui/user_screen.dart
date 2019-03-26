import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../model/user.dart';
import 'user_detail.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
            future: _loadUsers(),
            builder: (BuildContext context,AsyncSnapshot<List<User>> snapshot){

              if(snapshot.data ==null){
                return Center(
                  child: Text('loading...'),
                );
              }else{

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder:(BuildContext context, int index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data[index].picture),
                      ),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].email),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDetailScreen(snapshot.data[index])));
                      },

                    );
                  }

              );
            }}
        ),
      ),
    );
  }

  Future<List<User>> _loadUsers()async{
    
    var data = await http.get('https://www.json-generator.com/api/json/get/cfwZmvEBbC?indent=2');
    var jsonData= json.decode(data.body);
    List<User> users=[];
    for(var u in jsonData){
      var user= User(u['index'],u['name'],u['email'],u['about'],u['picture']);
      users.add(user);
    }

    print(users.length);
    return users;
  }
}
