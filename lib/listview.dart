import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  String _name;
  String _email;
  String _password;

  // void _submitCommand() {
  //   final form = formKey.currentState;
  //   if (form.validate()) {
  //     form.save();
  //     // Email & password matched our validation rules
  //     // and are saved to _name, _email and _password fields.
  //     _loginCommand();
  //   }
  // }

  // void _loginCommand() {
  //   // This is just a demo, so no actual login here.
  //   final snackbar = SnackBar(
  //     content: Text('Name: $_name, Email: $_email, password: $_password'),
  //   );

  //   scaffoldKey.currentState.showSnackBar(snackbar);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomPadding: false ,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Notes', 
        style: TextStyle( fontWeight: FontWeight.w500, fontSize: 17.0, color: Colors.black )),
      ),      
      body: SizedBox(
      child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              elevation: 4.0,
              margin: EdgeInsets.only(left: 15.0,right: 15.0),
              child: Column(
              children: [         
                Padding(padding: EdgeInsets.only(top: 0)),
                ListTile(
                  contentPadding: EdgeInsets.only(top:0, right: 15.0, left: 15.0, bottom: 0),
                  title: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add Note",
                      style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600, fontSize: 16.0),
                    ),
                  ),
                 ),
                 ListTile(
                      title: new TextField(
                      decoration: new InputDecoration(
                      hintText: "Title",
                   ),
                  ),
                 ), 
                 ListTile(
                      title: new TextField(
                      decoration: new InputDecoration(
                      hintText: "Description",
                   ),
                  ),
                 ),
                 ListTile(
                  trailing: Container(
                          width: 90.0,
                          height: 40.0,
                          child: RaisedButton(
                            elevation: 4.0,     
                            padding: const EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: () {},
                            child: Text("Add"),
                            textColor: Colors.white,
                            color: Colors.lightBlueAccent[400]
                        )
                  ),
                 ),  
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Align(
                alignment: Alignment(-0.9, 0),
                child: Text("Note List", style: TextStyle(color: Colors.grey[600], 
                fontWeight: FontWeight.bold, fontSize: 16.0 )),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              elevation: 4.0,
              margin: EdgeInsets.only(left: 15.0,right: 15.0),
              child: Column(
              children: [         
                Padding(padding: EdgeInsets.only(top: 5.0)),
                ListTile(
                  contentPadding: EdgeInsets.only(top:0, right: 15.0, left: 15.0, bottom: 0),
                  leading: Container(
                    // padding: EdgeInsets.only(right: 5.0),
                    height: 40.0,
                    width: 40.0,
                    decoration: new BoxDecoration(
                          color: Colors.blue[300],
                          shape: BoxShape.circle,                    
                        ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("1", style: TextStyle(color: Colors.white, 
                        fontWeight: FontWeight.bold, fontSize: 15.0 )),
                    ) 
                    // Text("1", style: TextStyle(color: Colors.white, fontSize: 10.0 ))
                  ),
                  title: Text(
                    "Note Title 1",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14.0),
                  ),
                  subtitle: Row(
                    children: <Widget>[                
                      Text("Note Description 1", style: TextStyle(color: Colors.grey, fontSize: 14.0))
                    ],
                  ),
                  trailing:
                    Icon(Icons.delete, color: Colors.grey)
                    ),
                  ],
                ),
              ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              elevation: 4.0,
              margin: EdgeInsets.only(left: 15.0,right: 15.0),
              child: Column(
              children: [         
                Padding(padding: EdgeInsets.only(top: 5.0)),
                ListTile(
                  // contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  contentPadding: EdgeInsets.only(top:0, right: 15.0, left: 15.0, bottom: 0),
                  leading: Container(
                    // padding: EdgeInsets.only(right: 5.0),
                    height: 40.0,
                    width: 40.0,
                    decoration: new BoxDecoration(
                          color: Colors.blue[300],
                          shape: BoxShape.circle,                    
                        ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("2", style: TextStyle(color: Colors.white, 
                        fontWeight: FontWeight.bold, fontSize: 15.0 )),
                    ) 
                  ),
                  title: Text(
                    "Note Title 2",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14.0),
                  ),
                  subtitle: Row(
                    children: <Widget>[                
                      Text("Note Description 2", style: TextStyle(color: Colors.grey, fontSize: 14.0))
                    ],
                  ),
                  trailing:
                    Icon(Icons.delete, color: Colors.grey)),
                    // Divider(),
                  ],
                ),
              ),
          ],
        )
      )
    );
  }
}