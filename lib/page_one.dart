import 'package:activity4_virtudes_cabaluna/form_handling.dart';
import 'package:flutter/material.dart';

class HomePageAppLayoutActivity4 extends StatefulWidget {
  const HomePageAppLayoutActivity4({Key? key}) : super(key: key);

  @override
  State<HomePageAppLayoutActivity4> createState() =>
      _HomePageAppLayoutActivity4State();
}


class _HomePageAppLayoutActivity4State extends State<HomePageAppLayoutActivity4> {


  late List studentsInformation = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 4'),
      ),
      body: ListView.builder(
        itemCount: studentsInformation.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(studentsInformation[index]['names']),
            subtitle: Text(studentsInformation[index]['section']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FormHandlingPage(data: 'Add Student Information')
              )
          );
          setState(() {
            studentsInformation = result;
          });
        },
      ),
    );
  }
}
