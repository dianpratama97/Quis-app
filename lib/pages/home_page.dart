import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/pages/test_page.dart';
import 'package:quiz/models/question_model.dart';
import 'package:http/http.dart' as myHttp;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late QuestionModel questions;
  TextEditingController usenameController = TextEditingController();

  final String url =
      "https://script.google.com/macros/s/AKfycbxXQ2dSt1v70PDTizpCRR2WPVSRppKgikF85GQBQyhN4qEJreuJzepHgQlBI3Fl1o6Y/exec";
  void getAllData(String username) async {
    try {
      var response = await myHttp.get(Uri.parse(url));
      questions = QuestionModel.fromJson(json.decode(response.body));
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TestPage(
                questionModel: questions,
                username: username,
              )));
    } catch (err) {
      print("error = " + err.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 127, 2, 205),
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //text
          Text('UJIAN APP',
              style: GoogleFonts.montserrat(fontSize: 26, color: Colors.white)),

          //textField
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: usenameController,
              decoration: InputDecoration(
                  hintText: "Username", fillColor: Colors.white, filled: true),
            ),
          ),

          //button
          ElevatedButton(
              onPressed: () {
                getAllData(usenameController.text);
              },
              child: Text("M U L A I"))
        ]),
      )),
    );
  }
}
