import 'package:flutter/material.dart';
import 'model.dart';
import 'api_call.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<BrowsePage> {

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
            children: const <Widget>[
              BeringTitle(),
              Spacer(),
              Expanded(
                  child:RecommendedList(),
              ),
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

class RecommendedList extends StatefulWidget {
  const RecommendedList({Key? key}) : super(key: key);

  @override
  State<RecommendedList> createState() => _RecommendedList();
}

class _RecommendedList extends State<RecommendedList> {

  late County? countyModel;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    countyModel = (await ApiService().getCounty())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countyModel!.data.where((element) => element.county.contains("AK")).length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(countyModel!.data![index+67].county),
                  Text(countyModel!.data![index+67].propertyValue.toString()),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        );
      },
    );

  }

}