import 'package:activity4_virtudes_cabaluna/page_one.dart';
import 'package:flutter/material.dart';

class FormHandlingPage extends StatefulWidget {
  final String data;
  const FormHandlingPage({Key? key, required this.data}) : super(key: key);

  @override
  State<FormHandlingPage> createState() => _FormHandlingPageState();
}

class _FormHandlingPageState extends State<FormHandlingPage> {
  String? genderChosen;
  List<dynamic> genders = ['Male', 'Female', 'Others', 'Prefer not '];

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  var formKeyUsage = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data),
      ),
      body: Form(
        key: formKeyUsage,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            TextFormField(
              controller: idController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: "Input Student ID",
                labelText: "ID",
              ),
              validator: (value) {
                return (value == '') ? 'Please enter Student ID' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: "Input Student name",
                labelText: "Name",
              ),
              validator: (value) {
                return (value == '') ? 'Please enter Student Name' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: birthdateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                hintText: "Input Student Birthdate MM/DD/YYYY",
                labelText: "Birthdate MM/DD/YYYY",
              ),
              validator: (value) {
                return (value == '') ? 'Please enter Student Birthday' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: courseController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: "Input Student Course",
                labelText: "Course",
              ),
              validator: (value) {
                return (value == '') ? 'Please enter Student Course' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: sectionController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: "Input Student Section",
                labelText: "Section",
              ),
              validator: (value) {
                return (value == '') ? 'Please enter Student Section' : null;
              },
            ),
            const SizedBox(height: 40),
            DropdownButton<String>(
                value: genderChosen,
                items: genders.map<DropdownMenuItem<String>>(
                      (newValue) {
                    return DropdownMenuItem<String>(
                      value: newValue,
                      child: Text(newValue),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    genderChosen = newValue!;
                  });
                }),
            SizedBox(
              height: 40,
              child: ElevatedButton(onPressed: () {
                var formValid = formKeyUsage.currentState!.validate();
                if (formValid){
                  Navigator.pop(context, Students(
                    id: idController.text,
                    name: nameController.text,
                    birthday: birthdateController.text,
                    course: courseController.text,
                    yearandSection: sectionController.text,
                    gender: genderChosen,
                  ));
                }
              }, child: const Text("Submit")),
            ),
          ],
        ),
      ),
    );
  }
}

