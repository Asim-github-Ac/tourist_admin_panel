import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class UploadClass extends StatefulWidget {
  const UploadClass({Key? key}) : super(key: key);

  @override
  State<UploadClass> createState() => _UploadClassState();
}

class _UploadClassState extends State<UploadClass> {
   Item? selectedUser;
  List<Item> users =<Item>[
    const Item("Cloths"),
    const Item("Food"),
    const Item("Funds"),
    const Item("Health"),
    const Item("Education"),
  ];
  File? _image;
  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        title: Text("Tourists Admin",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
        backgroundColor:Color(0xff009688),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget> [
              new Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
                color: Colors.white,
                child: _image != null
                    ? Image.file(_image!,fit: BoxFit.cover,)
                    : const Text("Please Select an Image"),
              ),
              SizedBox(
                height: 20,
              ),
              new Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: DropdownButton<Item>(
                    elevation: 8,
                    isExpanded: true,
                    style: TextStyle(fontSize: 18),
                    hint: Text("Select an Item"),
                    value: selectedUser,
                    onChanged: (Value){
                        setState(() {
                          selectedUser=Value;
                        });
                    },
                    items: users.map((Item user) {
                      return  DropdownMenuItem<Item>(
                        value: user,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10,),
                            Text(
                              user.name,
                              style:  TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              new SizedBox(
                height: 20,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:Color(0xff0EA89C),
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          maximumSize: const Size(200, 45),
                          minimumSize: const Size(200, 45),
                        ),
                        child: const Text("Select"),
                        onPressed: _openImagePicker,
                      ),

                  ),
                  new SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:Color(0xff0EA89C),
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          maximumSize: const Size(200, 45),
                          minimumSize: const Size(200, 45),
                        ),
                        child: const Text("Upload"),
                        onPressed: (){},
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Item{
  const Item(this.name);
  final String name;
}