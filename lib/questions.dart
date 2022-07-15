import 'package:bering/browse.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);
  @override
  _QuestionsState createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsPage> {

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
              QuestionText(),
              Image(image: AssetImage('assets/images/lugguage.png'), height: 300,),
              QuestionFields(),

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

class QuestionText extends StatelessWidget {
  const QuestionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("GET STARTED!", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255,63, 96, 160),
            ),),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Hello! Answer a few questions to get started.", style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255,63, 96, 160),
            ),),
          ],
        ),
      ],
    );
  }

}


class QuestionFields extends StatefulWidget {
  const QuestionFields({Key? key}) : super(key: key);

  @override
  State<QuestionFields> createState() => _QuestionFields();
}

class _QuestionFields extends State<QuestionFields> {

  var selectedHousingPrice = "\$200,000 - \$100,000";
  var selectedEnvironment = "Urban";

  var housingPrice = [
    "\$400,000 - \$300,000",
    "\$300,000 - \$200,000",
    "\$200,000 - \$100,000",
    "\$100,000 or lower",
  ];

  var environments = [
    "Urban",
    "Rural",
    "Mountainous",
    "Coastal",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          Row(
            children: const <Widget>[
              SizedBox(width: 7,),
              Text("Preferred Housing Price Range", style: TextStyle(
                fontSize: 20,
              ),),
            ],
          ),

          FormField<String>(
            builder: (FormFieldState<String> state) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: InputDecorator(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black12, fontSize: 16),
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16),
                      hintText: 'Please select expense',
                      border: OutlineInputBorder()),
                  isEmpty: selectedHousingPrice == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedHousingPrice,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedHousingPrice = newValue!;
                        });
                      },
                      items: housingPrice.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 10,),

          Row(
            children: const <Widget>[
              SizedBox(width: 7,),
              Text("Preferred Environment", style: TextStyle(
                fontSize: 20,
              ),),
            ],
          ),

          FormField<String>(
            builder: (FormFieldState<String> state) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: InputDecorator(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black12, fontSize: 16),
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16),
                      hintText: 'Please select expense',
                      border: OutlineInputBorder()),
                  isEmpty: selectedEnvironment == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedEnvironment,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedEnvironment = newValue!;
                        });
                      },
                      items: environments.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 20,),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                primary: Color.fromARGB(255,63, 96, 160),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                )
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BrowsePage())
              );
            },
            child: const Text(
              'SUBMIT',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}