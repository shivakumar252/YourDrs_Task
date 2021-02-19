import 'dart:io';

import 'package:YourDrs_App/common/colors.dart';
import 'package:YourDrs_App/components/recorder.dart';
import 'package:YourDrs_App/screens/dictation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ManualDictation extends StatefulWidget {
  int initialvalue;
  ManualDictation(this.initialvalue);
  @override
  _ManualDictationState createState() => _ManualDictationState();
}

class _ManualDictationState extends State<ManualDictation> {
  bool isSwitched = false;
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("John Cart"),
          backgroundColor: CustomizedColors.themeColor,
        ),
        body: Container(
          color: CustomizedColors.whitecolor,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 60.0,
                              backgroundImage: NetworkImage(
                                  "https://cdn1.vectorstock.com/i/thumb-large/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg"),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("02-12-2021",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                                Text("PC-MD", style: TextStyle(fontSize: 16.0)),
                                Text(
                                  "John Cart",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("(Male,128)",
                                    style: TextStyle(fontSize: 16.0)),
                                Text("Dictation Completed",
                                    style: TextStyle(fontSize: 16.0)),
                              ],
                            ),
                          ]),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("start file"),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.blueAccent,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: CustomizedColors.themeColor,
                      heroTag: "mic",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      backgroundColor: CustomizedColors.themeColor,
                      heroTag: "camera",
                      onPressed: () {
                        final action = CupertinoActionSheet(
                          actions: [
                            CupertinoActionSheetAction(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
// Icon(Icons.camera, color: Colors.blue),
                                  Text("Camera"),
                                ],
                              ),
                              onPressed: () {
                                openCamera();
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
// Icon(Icons.photo_library_outlined,
// color: Colors.blue),
                                  Text("Photo Library"),
                                ],
                              ),
                              onPressed: () {
                                openGallery();
                              },
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                        showCupertinoModalPopup(
                            context: context, builder: (context) => action);
                      },
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // if you need this
                    side: BorderSide(
                      color: Colors.black45,
                      width: 1,
                    ),
                  ),
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    width: 300,
                    height: 100,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Date of Birth"),
                                Text("02-26-2000"),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Case Number"),
                                Text("HEMA_YRDS0015"),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("PC-MD"),
                                Text("Checked-Out"),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 350,
                      child: RaisedButton.icon(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        label: Text(
                          'SuperBill',
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 18.0),
                        ),
                        icon: Icon(
                          Icons.notes,
                          color: Colors.blueAccent,
                        ),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.blue[50],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      width: 350,
                      child: RaisedButton.icon(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        label: Text(
                          'All Dictation',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 18.0),
                        ),
                        icon: Icon(
                          Icons.file_copy,
                          color: Colors.blueAccent,
                        ),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.blue[50],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      width: 350,
                      child: RaisedButton.icon(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        label: Text(
                          'Images',
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 18.0),
                        ),
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.blueAccent,
                        ),
                        textColor: Colors.white,
                        splashColor: Colors.red,
                        color: Colors.blue[50],
                      ),
                    ),
                  ],
                )
              ]),
        ));
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: CustomizedColors.themeColor,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Take a Picture',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text(
                      'Select image From Gallery',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onTap: openGallery,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    });
  }
}
