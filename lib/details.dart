import 'package:flutter/material.dart';
import 'page_one.dart';

class DetailsPage extends StatelessWidget {
  final Students information;
  const DetailsPage(this.information, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${information.name}"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const Text("ID",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(": ${information.id}",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Name",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(": ${information.name}",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Birthday",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(": ${information.birthday}",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Gender",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(": ${information.gender}",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Year & Section",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(": ${information.yearandSection}",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Course",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(": ${information.course}",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}