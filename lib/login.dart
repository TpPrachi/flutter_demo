import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  String _name;
  String _email;
  String _password;

  void _submitCommand() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _name, _email and _password fields.
      _loginCommand();
    }
  }

  void _loginCommand() {
    // This is just a demo, so no actual login here.
    final snackbar = SnackBar(
      content: Text('Name: $_name, Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Sign Up', 
        style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black )),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: (){}
        )
      ),      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Your Name', icon: Icon(Icons.person)),                
                onSaved: (val) => _name = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email', icon: Icon(Icons.email)),
                validator: (val) => !EmailValidator.Validate(val, true)
                    ? 'Not a valid email.'
                    : null,
                onSaved: (val) => _email = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password', icon: Icon(Icons.lock_outline)),
                validator: (val) =>
                    val.length < 4 ? 'Password too short.' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('Terms of Use', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12.0 )),
                Text(' and '),
                Text('Privacy Policy', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12.0 )),
              ]),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Container(
                width: 350.0,
                height: 40.0,
                child: RaisedButton(
                  elevation: 10.0,
                  padding: const EdgeInsets.all(8.0),
                  onPressed: _submitCommand,
                  child: Text('Sign Up'),
                  textColor: Colors.white,
                  color: Colors.black
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('Or sign up with social account', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14.0 )),
              ]),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      Container(
                        width: 150.0,
                        height: 40.0,
                        child: RaisedButton(    
                            elevation: 4.0,                      
                            padding: const EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            onPressed: () {},
                            child: Image.asset(
                                'images/facebook.png', 
                                width: 20.0,
                                height: 20.0,
                            ),
                            textColor: Colors.white,
                            color: Colors.lightBlue[900]
                        ),
                      ),
                      Container(
                        width: 150.0,
                        height: 40.0,
                        child: RaisedButton(
                          elevation: 4.0,     
                          padding: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {},
                          child: Image.asset(
                              'images/twitter.png', 
                              width: 20.0,
                              height: 20.0,
                          ),
                          textColor: Colors.white,
                          color: Colors.lightBlueAccent[400]
                      )
                      ),
                      
                  ],
                )
              ),
              
              // FloatingActionButton.extended(
              //   onPressed: () {},
              //   icon: Icon(Icons.save),
              //   label: Text(""),
              // ),
              // RaisedButton(
              //   onPressed: _submitCommand,
              //   child: Text('Sign Up'),
              //   textColor: Colors.white,
              //   color: Colors.black,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// SignInButton(
//   Buttons.Facebook,
//   mini: true,
//   onPressed: () {},
  
// ),
// SignInButton(
//   Buttons.Twitter,
//   mini: true,
//   onPressed: () {},
// ),