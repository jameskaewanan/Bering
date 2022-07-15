import 'package:bering/login.dart';
import 'package:bering/questions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  _SignupState createState() {
    return _SignupState();
  }
}

class _SignupState extends State<SignupPage> {

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
            children: <Widget>[

              BeringTitle(),
              SizedBox(height: 10,),
              SignupText(),
              SizedBox(height: 20,),
              SignupFields(),

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

class SignupText extends StatelessWidget {
  const SignupText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("SIGN UP", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255,63, 96, 160),
            ),),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Sign up to use Bering!", style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255,63, 96, 160),
            ),),
          ],
        ),
      ],
    );
  }

}


class SignupFields extends StatefulWidget {
  const SignupFields({Key? key}) : super(key: key);

  @override
  State<SignupFields> createState() => _SignupFields();
}


class _SignupFields extends State<SignupFields> {

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  late FirebaseAuth _auth;

  String username = "";
  String fullname = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        // USERNAME

        Row(
          children: const <Widget>[
            SizedBox(width: 7,),
            Text("Username", style: TextStyle(
              fontSize: 20,
            ),),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: TextFormField(
            onChanged: (value) {
              username = value.toString().trim();
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
        ),
        const SizedBox(height: 10,),

        // FULL NAME

        Row(
          children: const <Widget>[
            SizedBox(width: 7,),
            Text("Full name", style: TextStyle(
              fontSize: 20,
            ),),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextFormField(
            keyboardType: TextInputType.name,
            onChanged: (value) {
              fullname = value.toString().trim();
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Full name',
            ),
          ),
        ),
        SizedBox(height: 10,),

        // E-MAIL ADDRESS

        Row(
          children: const <Widget>[
            SizedBox(width: 7,),
            Text("E-mail Address", style: TextStyle(
              fontSize: 20,
            ),),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value.toString().trim();
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'E-mail Address',
            ),
          ),
        ),
        SizedBox(height: 10,),

        // PASSWORD

        Row(
          children: const <Widget>[
            SizedBox(width: 7,),
            Text("Password", style: TextStyle(
              fontSize: 20,
            ),),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextFormField(
            onChanged: (value) {
              password = value.toString().trim();
            },
            obscureText: true,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        SizedBox(height: 10,),

        // CONFIRM PASSWORD

        Row(
          children: const <Widget>[
            SizedBox(width: 7,),
            Text("Confirm Password", style: TextStyle(
              fontSize: 20,
            ),),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Confirm Password',
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Have an account?"),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())
                );
              },
              child: const Text('Login!'),
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
          onPressed: () async{
            try{
              final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
            } catch (e) {
              print(e);
            }
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage())
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