import 'package:bering/questions.dart';
import 'package:bering/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255,63, 96, 160), Color(0xffffffff)],
                  begin: FractionalOffset(1, 1.5)
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const <Widget>[

              BeringTitle(),
              SizedBox(height: 30,),
              WelcomeText(),
              Image(image: AssetImage('assets/images/lugguage.png')),
              LoginFields(),


            ],
          ),
        ),
      ),

    );


  }
}

class BeringTitle extends StatelessWidget {
  const BeringTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255,63, 96, 160),
          shape: BoxShape.circle,
        ),
      ),
        const SizedBox(width: 10),

        const Text("BERING", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ],
    );
  }

}

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("WELCOME!", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255,63, 96, 160),
            ),),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Please log in or sign up to continue.", style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255,63, 96, 160),
            ),),
          ],
        ),
      ],
    );
  }

}

class LoginFields extends StatefulWidget {
  const LoginFields({Key? key}) : super(key: key);

  @override
  State<LoginFields> createState() => _LoginFields();
}

class _LoginFields extends State<LoginFields> {

  late FirebaseAuth _auth;
  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Row(
          children: const <Widget>[
            SizedBox(width: 7,),
            Text("Login", style: TextStyle(
              fontSize: 20,
            ),),
          ],
        ),

        Padding(
          padding: EdgeInsets.all(5),
          child: TextFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(5),
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Don't have an account? "),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage())
                );
              },
              child: const Text('Sign Up!'),
            ),
          ],
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 50),
            primary: Color.fromARGB(255,63, 96, 160),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            )
          ),
          onPressed: () async {

            try {
              final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
              if (user != null) {
                print("$email is in");
              } else {
                print("Login Failed");
              }
            } catch (e) {
              print(e);
            }

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QuestionsPage())
            );
          },
          child: const Text(
            'SUBMIT',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}