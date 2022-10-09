import 'package:flutter/material.dart';
import 'package:tourist_admin/utils/universal_variables.dart';

import 'Order.dart';
import 'Setting.dart';
import 'Upload.dart';

class AdminClass extends StatefulWidget {
  const AdminClass({Key? key}) : super(key: key);

  @override
  State<AdminClass> createState() => _AdminClassState();
}

class _AdminClassState extends State<AdminClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: [
              OrderClass(),
              UploadClass(),
              SettingClass(),
            ],
          ),

          bottomNavigationBar: Container(
          //  color: Colors.orange,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            height: 65,
            width: 30,
            decoration: BoxDecoration(
              color: Color(0xff009688),
              borderRadius: BorderRadius.circular(30),
            ),
            child:TabBar(
              labelColor: Colors.yellow, //<-- selected text color
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(icon: ImageIcon(AssetImage("assests/order.png")),text: "Order",),
                Tab(icon: ImageIcon(AssetImage("assests/upload.png")),text: "Upload",),
                Tab(icon: ImageIcon(AssetImage("assests/setting.png")),text: "Setting",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
