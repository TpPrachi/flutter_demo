import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

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
        title: Text('Sign Up', 
        style: TextStyle( fontWeight: FontWeight.bold, fontSize: 17.0 )),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios),
          // onPressed:() => Navigator.pop(context, true),
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
                decoration: InputDecoration(labelText: 'Your Name'),
                onSaved: (val) => _name = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (val) => !EmailValidator.Validate(val, true)
                    ? 'Not a valid email.'
                    : null,
                onSaved: (val) => _email = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                validator: (val) =>
                    val.length < 4 ? 'Password too short.' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              // Center(                
              //   // child: Text("Main Screen"),
              //       child: Text('Terms of Use', 
              //         style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12.0 )), 
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('Terms of Use', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12.0 )),
                Text(' and '),
                Text('Privacy Policy', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12.0 )),
              ]),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              ButtonTheme(
                minWidth: 350.0,
                height: 40.0,
                child: RaisedButton(
                  // color: Theme.of(context).accentColor,
                  padding: const EdgeInsets.all(8.0),
                  onPressed: _submitCommand,
                  child: Text('Sign Up'),
                  textColor: Colors.white,
                  color: Colors.black,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('Or sign up with social account', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14.0 )),
              ]),
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