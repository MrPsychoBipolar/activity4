import 'package:activity4_virtudes_cabaluna/form_handling.dart';
import 'package:activity4_virtudes_cabaluna/details.dart';
import 'package:flutter/material.dart';

class HomePageAppLayoutActivity4 extends StatefulWidget {
  const HomePageAppLayoutActivity4({Key? key}) : super(key: key);

  @override
  State<HomePageAppLayoutActivity4> createState() =>
      _HomePageAppLayoutActivity4State();
}

class Students {
  String? id;
  String? name;
  String? birthday;
  String? gender;
  String? yearandSection;
  String? course;

  Students(
      {this.id,
        this.name,
        this.gender,
        this.birthday,
        this.yearandSection,
        this.course});
}

class _HomePageAppLayoutActivity4State extends State<HomePageAppLayoutActivity4> {


  late List studentsInformation = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 4'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => const FormHandlingPage(data: '')));
              setState(() {
               if (result != "") {
              studentsInformation.add(result);
            }
          });
        },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: studentsInformation.length,
          itemBuilder: (context, index) {
            Students information = studentsInformation[index];
            final dismiss = studentsInformation[index];
            return Dismissible(
                background: Container(color: Colors.red,),
                key: Key(dismiss.toString()),
                onDismissed: (direction) {
                  setState(() {
                    studentsInformation.removeAt(index);
                  });
                },
                child:Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(20),
                      title: Text("${information.name}"),
                      subtitle: Text("${information.course} - ${information.yearandSection}"),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(information)));
             },
          ))
        );
      }),
    );
  }
}
