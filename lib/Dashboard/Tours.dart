import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SettingClass extends StatefulWidget {
  const SettingClass({Key? key}) : super(key: key);

  @override
  State<SettingClass> createState() => _SettingClassState();
}

class _SettingClassState extends State<SettingClass> {

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Tours').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          appBar: AppBar(title: Text("Tours List"),),
          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Card(
                margin: EdgeInsets.all(10),
                elevation: 10,
                child: ListTile(
                  title: Column(
                    children: [
                    Container(
                        height: 200,
                        width: 200,
                        child: Image.network(data['url'])),
                    SizedBox(height: 10,),
                    Row(children: [Text("Place Name: ",style: TextStyle(color: Colors.blue,fontSize: 20),),Text(data['placename'])],)
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(children: [Text("Place Des: ",style: TextStyle(color: Colors.blue,fontSize: 18),),Text(data['desplace'])],),
                      Row(children: [Text("Place Date: ",style: TextStyle(color: Colors.blue,fontSize: 18),),Text(data['date'])],),
                      Row(children: [Text("Place Stay: ",style: TextStyle(color: Colors.blue,fontSize: 18),),Text(data['stay'])],),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );

  }
}