/*We use a global key to access a widget that is already rendered on the screen
stateless widgets are easier with global key than stateful
Since form is a stateful widget.... behind the scenes we want to create a 
global key thet links to the FormState and not the form itself */
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  final formKey = GlobalKey<FormState>(); //created a global key to form state
  String email = '';
  String password = '';
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin:EdgeInsets.only(bottom: 25.0)), //Just adds some margin
            submitButton(),
          ]
        ),
      ),
    );
  }
  Widget emailField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@youtube.com',
      ),
      keyboardType: TextInputType.emailAddress,        //specifies the type of keyboard to be used when user wants to enter in this textinputfield
      validator: (String value) {
        //null if valid
        //string with error message if valid
        if(!value.contains('@')){
          return "Please Enter a valid Email";
        }
      },
      onSaved: (value) {
        email = value;                 //what to do onsave ??
      },
    );
  }
  Widget passwordField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,                //Hides the text 
      validator: (String value) {
        //null if valid
        //string with error message if valid
        if(value.length < 4){
          return "Please Enter a longer password";
        }
      },
      onSaved: (value) {
        password = value;
      },
    );

  }
  Widget submitButton(){
    return RaisedButton(
      color: Colors.blue,
      onPressed:(){
        if(formKey.currentState.validate()){  //calls the validator function of each formfields
          formKey.currentState.save();
        } 
      } ,
      child: Text(
        'Submit',
      ),
      
    );
  }
}

//REUSE CODE USING MIXINS REFER VIDEOS