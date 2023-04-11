import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:quiz/models/question_model.dart';
import 'package:quiz/pages/result_page.dart';

class TestPage extends StatefulWidget {
  final QuestionModel questionModel;
  final String username;
  const TestPage(
      {super.key, required this.questionModel, required this.username});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 160, 248),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1/ " + widget.questionModel.data.length.toString(),
                  style:
                      GoogleFonts.montserrat(fontSize: 24, color: Colors.white),
                ),
                Text(
                  widget.username,
                  style:
                      GoogleFonts.montserrat(fontSize: 24, color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 150,
            width: 150,
            child: CountDownProgressIndicator(
              controller: _controller,
              valueColor: Color.fromARGB(255, 252, 0, 0),
              backgroundColor: Colors.white,
              initialPosition: 0,
              duration: 60,
              text: 'DETIK',
              onComplete: () => null,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "3 + 5 =",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 24, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ResultPage()));
            },
            child: OptionWidget(
              color: Color.fromARGB(255, 0, 121, 196),
              optionChar: "A",
              optionDetail: "1234",
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: OptionWidget(
              color: Color.fromARGB(255, 0, 121, 196),
              optionChar: "B",
              optionDetail: "1234",
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: OptionWidget(
              color: Color.fromARGB(255, 0, 121, 196),
              optionChar: "C",
              optionDetail: "1234",
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: OptionWidget(
              color: Color.fromARGB(255, 0, 121, 196),
              optionChar: "D",
              optionDetail: "1234",
            ),
          ),
        ],
      )),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String optionChar;
  final String optionDetail;
  final Color color;
  const OptionWidget({
    required this.optionChar,
    required this.optionDetail,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Text(
                optionChar,
                style:
                    GoogleFonts.montserrat(fontSize: 24, color: Colors.white),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text(
                  optionDetail,
                  textAlign: TextAlign.left,
                  style:
                      GoogleFonts.montserrat(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}
